import 'package:ccr_app/app/data/models/models.dart';
import 'package:ccr_app/app/data/providers/local/cache.dart';
import 'package:ccr_app/app/helpers/date_helper.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DBIsar {
  late Future<Isar> db;

  DBIsar() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      // agregar los schemas que se generen
      return await Isar.open([
        BocaModelSchema,
        CabeceraModelSchema,
        ItemModelSchema,
        RespuestaCabModelSchema,
        RespuestaDetModelSchema
      ], inspector: true, directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }

  Future<void> deleteAllBocas() async {
    final isar = await db;
    await isar.writeTxn(() async => await isar.bocaModels.clear());
  }

  Future<void> deleteAllCabeceras() async {
    final isar = await db;
    await isar.writeTxn(() async => await isar.cabeceraModels.clear());
  }

  Future<void> deleteAllItems() async {
    final isar = await db;
    await isar.writeTxn(() async => await isar.itemModels.clear());
  }

  Future<void> insertListBocas(List<BocaModel> list) async {
    final isar = await db;

    await isar.writeTxn(() async {
      for (var data in list) {
        await isar.bocaModels.put(data);
      }
    });
  }

  Future<void> insertListCabeceras(List<CabeceraModel> list) async {
    final isar = await db;

    await isar.writeTxn(() async {
      for (var data in list) {
        await isar.cabeceraModels.put(data);
      }
    });
  }

  Future<void> insertListItems(List<ItemModel> list) async {
    final isar = await db;

    await isar.writeTxn(() async {
      for (var data in list) {
        await isar.itemModels.put(data);
      }
    });
  }

  Future<List<BocaModel>> getBocas(
      {int limit = 10,
      int offset = 0,
      String term = '',
      String ciudad = '',
      bool mostrarRelevados = true}) async {
    final isar = await db;

    List<RespuestaCabModel> respuestas = [];
    if (mostrarRelevados) {
      respuestas = await getRespuestasByEstado(sincronizado: false);
    }
    List<BocaModel> result = [];

    if (term.isNotEmpty && ciudad.isEmpty) {
      result = await isar.bocaModels
          .filter()
          .nombreContains(term, caseSensitive: false)
          .or()
          .codBocaContains(term, caseSensitive: false)
          .sortByNombre()
          .findAll();
    } else if (ciudad.isNotEmpty && term.isEmpty) {
      result = await isar.bocaModels
          .filter()
          .ciudadEqualTo(ciudad, caseSensitive: false)
          .sortByNombre()
          .findAll();
    } else if (ciudad.isNotEmpty && term.isNotEmpty) {
      result = await isar.bocaModels
          .filter()
          .nombreContains(term, caseSensitive: false)
          .or()
          .codBocaContains(term, caseSensitive: false)
          .and()
          .ciudadEqualTo(ciudad, caseSensitive: false)
          .sortByNombre()
          .findAll();
    } else {
      result = await isar.bocaModels
          .where()
          .sortByNombre()
          .offset(offset)
          .limit(limit)
          .findAll();
    }

    if (respuestas.isNotEmpty) {
      // Crear un Set de codBoca para búsqueda rápida
      final Set<String> codBocas = respuestas.map((r) => r.codBoca).toSet();

      // Iterar sobre la lista de bocas y establecer estaRelevado en true si el codBoca está en el Set
      for (var boca in result) {
        if (codBocas.contains(boca.codBoca)) {
          boca.estaRelevado = true;
        }
      }
    }

    result.sort(
        (a, b) => (a.estaRelevado ? 1 : 0).compareTo(b.estaRelevado ? 1 : 0));
    return result;
  }

  Future<List<String>> getCiudades() async {
    final bocas = await getBocas();

    return bocas.map((b) => b.ciudad).toSet().toList();
  }

  Future<List<CabeceraModel>> getCabeceras() async {
    final isar = await db;

    final cabeceras = await isar.cabeceraModels.where().findAll();

    await Future.wait(cabeceras.map((c) async {
      c.items = await getItems(cabecera: c.codigo);
    }));

    return cabeceras;
  }

  Future<List<ItemModel>> getItems({String? cabecera}) async {
    final isar = await db;
    if (cabecera != null) {
      return await isar.itemModels
          .filter()
          .codCabeceraEqualTo(cabecera, caseSensitive: false)
          .findAll();
    }

    return await isar.itemModels.where().findAll();
  }

  Future<BocaModel?> findBocaById(int id) async {
    final isar = await db;
    final boca = await isar.bocaModels.filter().idEqualTo(id).findFirst();

    final respuesta = await findRespuestaByBocaId(boca!.id);
    boca.estaRelevado = respuesta != null;
    return boca;
  }

  Future<int?> insertRespuesta(RespuestaCabModel respuesta) async {
    final isar = await db;

    int? newId;
    await isar.writeTxn(() async {
      newId = await isar.respuestaCabModels.put(respuesta);
      for (var data in respuesta.detalles) {
        data.idRespuestaCab = newId;
        await isar.respuestaDetModels.put(data);
      }
    });

    return newId;
  }

  Future<List<RespuestaCabModel>> getRespuestasByEstado(
      {required bool sincronizado, bool getDetails = false}) async {
    final isar = await db;

    if (getDetails == true) {
      final list = await isar.respuestaCabModels
          .where()
          .filter()
          .sincronizadoEqualTo(sincronizado)
          .usuarioEqualTo(Cache.instance.loginData.usuario.usuario,
              caseSensitive: false)
          .findAll();

      if (list.isNotEmpty) {
        await Future.wait(list.map((r) async {
          r.detalles = await getRespuestaDetByCab(r.isarId!);
        }));
      }

      return list;
    }

    return isar.respuestaCabModels
        .where()
        .filter()
        .sincronizadoEqualTo(sincronizado)
        .usuarioEqualTo(Cache.instance.loginData.usuario.usuario,
            caseSensitive: false)
        .findAll();
  }

  Future<List<RespuestaDetModel>> getRespuestaDetByCab(
      int idIsarCabecera) async {
    final isar = await db;

    return await isar.respuestaDetModels
        .filter()
        .idRespuestaCabEqualTo(idIsarCabecera)
        .findAll();
  }

  Future<void> setRespuestaSincronizado(RespuestaCabModel respuesta) async {
    final isar = await db;
    respuesta.sincronizado = true;
    respuesta.fechaSincronizacion = DateHelper.dateToString(
        date: DateTime.now(), format: 'dd-MM-yyyy HH:mm');

    await isar.writeTxn(() async {
      await isar.respuestaCabModels.put(respuesta);
    });
  }

  Future<RespuestaCabModel?> findRespuestaById(int id) async {
    final isar = await db;
    final res =
        await isar.respuestaCabModels.filter().isarIdEqualTo(id).findFirst();

    if (res == null) {
      return res;
    }

    res.detalles = await getRespuestaDetByCab(res.isarId!);
    return res;
  }

  Future<RespuestaCabModel?> findRespuestaByBocaId(int id) async {
    final isar = await db;
    final res = await isar.respuestaCabModels
        .filter()
        .idBocaEqualTo(id)
        .sincronizadoEqualTo(false)
        .findFirst();

    if (res == null) {
      return res;
    }

    res.detalles = await getRespuestaDetByCab(res.isarId!);
    return res;
  }

  Future<void> deleteRespuesta(RespuestaCabModel respuesta) async {
    final isar = await db;

    final detalles = await isar.respuestaDetModels
        .filter()
        .idRespuestaCabEqualTo(respuesta.isarId)
        .findAll();
    await isar.writeTxn(() async {
      await isar.respuestaDetModels
          .deleteAll(detalles.map((d) => d.isarId!).toList());
      await isar.respuestaCabModels.delete(respuesta.isarId!);
    });
  }

  Future<void> deleteRespuestaSincronizadas() async {
    final isar = await db;

    final list = await isar.respuestaCabModels
        .filter()
        .sincronizadoEqualTo(true)
        .usuarioEqualTo(Cache.instance.loginData.usuario.usuario,
            caseSensitive: false)
        .findAll();

    if (list.isEmpty) {
      return;
    }

    await Future.wait(list.map((r) async {
      r.detalles = await getRespuestaDetByCab(r.isarId!);
      await isar.writeTxn(() async {
        await isar.respuestaDetModels
            .deleteAll(r.detalles.map((d) => d.isarId!).toList());
        await isar.respuestaCabModels.delete(r.isarId!);
      });
    }));
  }
}
