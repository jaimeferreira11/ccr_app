import 'package:ccr_app/app/data/providers/local/db_isar.dart';
import 'package:ccr_app/app/global_widgets/yes_no_dialog.dart';
import 'package:ccr_app/app/helpers/date_helper.dart';
import 'package:ccr_app/app/modules/home/home_controller.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

import '../../data/models/models.dart';
import '../../data/repositories/local/auth_repository.dart';
import '../../data/repositories/remote/server_repository.dart';
import '../../helpers/utils.dart';
import '../../routes/navigator.dart';

class DownloadController extends GetxController {
  final authRepo = Get.find<AuthRepository>();
  final serverRepo = Get.find<ServerRepository>();
  final nav = Get.find<NavigatorController>();
  final homeController = Get.find<HomeController>();

  RxBool workInProgress = false.obs;
  FormzSubmissionStatus status = FormzSubmissionStatus.initial;

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {}

  RxList<String> logs = <String>[].obs;

  descargar() async {
    if (await Utils.checkConnection(true) == false) {
      return;
    }

    final isar = DBIsar();

    final List<RespuestaCabModel> respuestasPendientes =
        await isar.getRespuestasByEstado(sincronizado: false, getDetails: true);

    if (respuestasPendientes.isNotEmpty) {
      DialogoSiNo().abrirDialogo("Tienes relevos pendientes",
          'Primero suba los relevos pendientes antes de descargar los datos.');

      return;
    }

    final dial = await DialogoSiNo().abrirDialogoSiNo(
        "¿Descargar ahora?", 'Se borrarán todos los datos del dispositivos');

    if (dial == 0) {
      return;
    }
    // workInProgress.value = true;
    status = FormzSubmissionStatus.inProgress;
    update();

    final futures = [
      serverRepo.getBocas(),
      serverRepo.getCabeceras(),
      serverRepo.getItems(),
    ];

    // Esperar a que todas las llamadas terminen
    logs.add("Descargando datos...");
    final responses = await Future.wait(futures);
    logs.clear();
    responses[0].fold(((l) => logs.last = '❌ No se descargaron las bocas '),
        (r) async {
      // 1. eliminar la base
      await isar.deleteAllBocas();

      // 2. Insertar los nuevos
      await isar.insertListBocas(r as List<BocaModel>);
      logs.add('✅ Se descargaron ${r.length} bocas');
      update();
    });
    responses[1].fold(((l) => logs.add('❌ No se descargaron las cabeceras')),
        (r) async {
      // 1. eliminar la base
      await isar.deleteAllCabeceras();

      // 2. Insertar los nuevos
      await isar.insertListCabeceras(r as List<CabeceraModel>);
      logs.add('✅ Se descargaron ${r.length} cabeceras');
      update();
    });
    responses[2].fold(((l) => logs.add('❌ No se descargaron los items')),
        (r) async {
      // 1. eliminar la base
      await isar.deleteAllItems();

      // 2. Insertar los nuevos
      await isar.insertListItems(r as List<ItemModel>);
      logs.add('✅ Se descargaron ${r.length} items');

      update();
    });
    // workInProgress.value = false;

    status = FormzSubmissionStatus.success;
    final syncData = await authRepo.getSyncData();

    syncData.fold(
      (failure) {
        final sync = SyncModel(
            download: DateHelper.dateToString(
                date: DateTime.now(), format: 'dd/MM/yyyy HH:mm'));
        homeController.addDataToStream(sync);
        authRepo.setSyncData(sync);
      },
      (data) {
        final sync = SyncModel(
            upload: data.upload,
            download: DateHelper.dateToString(
                date: DateTime.now(), format: 'dd/MM/yyyy HH:mm'));
        authRepo.setSyncData(sync);

        homeController.addDataToStream(sync);
      },
    );
    update();
  }

  cancelarDescarga() async {
    final dial = await DialogoSiNo().abrirDialogoSiNo(
        "¿Estas seguro?", 'Se borrarán todos los datos del dispositivos');

    if (dial == 0) {
      return;
    }
  }
}
