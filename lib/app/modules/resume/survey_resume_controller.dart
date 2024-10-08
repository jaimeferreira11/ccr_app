import 'dart:io';

import 'package:ccr_app/app/data/models/image_upload_dto_model.dart';
import 'package:ccr_app/app/helpers/notifications/notificacion_service.dart';
import 'package:get/get.dart';

import '../../../flavors/build_config.dart';
import '../../data/models/models.dart';
import '../../data/providers/local/db_isar.dart';
import '../../data/repositories/local/auth_repository.dart';
import '../../data/repositories/remote/server_repository.dart';
import '../../global_widgets/yes_no_dialog.dart';
import '../../helpers/file_helper.dart';
import '../../helpers/utils.dart';
import '../../routes/navigator.dart';

class SurveyResumeController extends GetxController {
  final authRepo = Get.find<AuthRepository>();
  final serverRepo = Get.find<ServerRepository>();
  final nav = Get.find<NavigatorController>();
  final notif = Get.find<NotificationService>();
  RxBool workInProgress = false.obs;
  final isar = DBIsar();

  RespuestaCabModel? respuesta;
  Map<String, List<RespuestaDetModel>> data = {};
  List<String> keys = [];

  bool isFromSurvey = true;

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {
    workInProgress.value = true;

    final id = Get.parameters['id'];

    final fromParam = Get.parameters['isFromSurvey'] ?? true;

    if (fromParam == 'false') {
      isFromSurvey = false;
    }

    if (id != null) {
      respuesta = await isar.findRespuestaById(int.parse(id));
      armarData();
      update(['resume-survey']);
    } else {
      nav.back();
    }
    workInProgress.value = false;
  }

  void armarData() {
    for (var respuesta in respuesta?.detalles ?? []) {
      if (data.containsKey(respuesta.cabecera)) {
        data[respuesta.cabecera]!.add(respuesta);
      } else {
        data[respuesta.cabecera] = [respuesta];
      }
    }

    // Ordenar cada lista de respuestas para que los elementos con valor "SI" aparezcan primero
    data.forEach((key, value) {
      value.sort((a, b) => b.valor.compareTo(a.valor));
    });

    keys = data.keys.toList();
  }

  bool existeImagenes() {
    if (respuesta!.imagenes.isEmpty) return false;

    // Retorna true si al menos una imagen existe.
    return respuesta!.imagenes.any((img) => File(img.pathImagen).existsSync());
  }

  Future<void> subirImagenes(RespuestaCabModel r) async {
    if (await Utils.checkConnection(true) == false) {
      return;
    }
    final dial = await DialogoSiNo().abrirDialogoSiNo(
        '¿Volver a subir la imagen?', 'Debes tener buena conexión a internet');

    if (dial == 0) {
      return;
    }

    try {
      workInProgress.value = true;
      await Future.delayed(const Duration(milliseconds: 50));

      List<ImageUploadDtoModel> images = [];

      await Future.wait(r.imagenes.map((img) async {
        final fileName =
            img.pathImagen.substring(img.pathImagen.lastIndexOf('/'));
        final imgBase64String =
            await FileHelper.convertFileToBase64(img.pathImagen);
        if (imgBase64String != null) {
          images.add(ImageUploadDtoModel(
              pathImagen:
                  '${BuildConfig.instance.config.imagesFolder}/${r.codBoca}$fileName',
              imgBase64String: imgBase64String,
              fechaCreacion: r.fechaCreacion));
        }
      }));

      final resp = await serverRepo.subirListImagen(images);
      workInProgress.value = false;

      resp.fold((l) => notif.mostrarInternalError(mensaje: l.mensaje),
          (r) async {
        await DialogoSiNo().abrirDialogoSucccess('Imagen subida nuevamente');
      });
    } catch (e) {
      print(e);
      workInProgress.value = false;
      notif.mostrarInternalError(mensaje: e.toString());
    }
  }

  Future<void> volverASincronizar(RespuestaCabModel respuesta) async {
    if (await Utils.checkConnection(true) == false) {
      return;
    }
    final dial = await DialogoSiNo().abrirDialogoSiNo(
        '¿Volver a sincronizar el relevo?',
        'Debes tener buena conexión a internet');

    if (dial == 0) {
      return;
    }

    try {
      workInProgress.value = true;
      await Future.delayed(const Duration(milliseconds: 50));

      workInProgress.value = true;
      final resp = await serverRepo.subirRespuestas([respuesta]);
      workInProgress.value = false;

      resp.fold((l) => notif.mostrarInternalError(mensaje: l.mensaje),
          (r) async {
        await DialogoSiNo().abrirDialogoSucccess('Relevo subido nuevamente');
      });
    } catch (e) {
      print(e);
      workInProgress.value = false;
      notif.mostrarInternalError(mensaje: e.toString());
    }
  }
}
