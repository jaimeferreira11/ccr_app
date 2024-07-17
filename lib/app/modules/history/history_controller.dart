import 'package:ccr_app/app/global_widgets/yes_no_dialog.dart';
import 'package:ccr_app/app/helpers/file_helper.dart';
import 'package:ccr_app/app/helpers/utils.dart';
import 'package:ccr_app/app/modules/history/views/history_all_view.dart';
import 'package:ccr_app/app/modules/history/views/history_pending_view.dart';
import 'package:ccr_app/app/modules/history/views/history_uploaded_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../flavors/build_config.dart';
import '../../data/models/models.dart';
import '../../data/providers/local/db_isar.dart';
import '../../data/repositories/local/auth_repository.dart';
import '../../data/repositories/remote/server_repository.dart';
import '../../helpers/notifications/notificacion_service.dart';
import '../../routes/navigator.dart';

class HistoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final authRepo = Get.find<AuthRepository>();
  final serverRepo = Get.find<ServerRepository>();
  final nav = Get.find<NavigatorController>();
  final notif = Get.find<NotificationService>();

  final isar = DBIsar();

  RxBool workInProgress = false.obs;

  TabController? tabController;

  List<Widget> children = [
    const HistoryPendindView(),
    const HistoryUploadedView(),
    const HistoryAllView()
  ];

  List<RespuestaCabModel> respuestasPendientes = [];
  List<RespuestaCabModel> respuestasSubidas = [];
  List<RespuestaCabModel> allRespuestas = [];

  List<RespuestaCabModel> respuestaToUpload = [];

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {
    workInProgress.value = true;
    tabController = TabController(length: 3, vsync: this);

    tabController?.addListener(
      () {
        update(['historico-page']);
      },
    );

    await getData();
    workInProgress.value = false;
  }

  Future<void> getData() async {
    respuestasPendientes =
        await isar.getRespuestasByEstado(sincronizado: false, getDetails: true);
    respuestaToUpload = [...respuestasPendientes];
    respuestasSubidas =
        await isar.getRespuestasByEstado(sincronizado: true, getDetails: true);

    allRespuestas = [...respuestasPendientes, ...respuestasSubidas];
    allRespuestas.sort((a, b) => a.fechaCreacion.compareTo(b.fechaCreacion));

    update(['historico-page']);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  Future<void> eliminarRespuesta(RespuestaCabModel respuesta) async {
    final dial = await DialogoSiNo()
        .abrirDialogoSiNo('¿Eliminar item?', 'Esta acción es irreversible');

    if (dial == 0) {
      return;
    }

    try {
      await isar.deleteRespuesta(respuesta);

      workInProgress.value = true;
      await getData();
      update();
      workInProgress.value = false;
      notif.mostrarSuccess(mensaje: 'Item eliminado');
    } catch (e) {
      print(e);
      notif.mostrarInternalError(
          mensaje: 'No se eliminó el item: ${e.toString()}');
    }
  }

  Future<void> subirRespuestas() async {
    if (await Utils.checkConnection(true) == false) {
      return;
    }
    final dial = await DialogoSiNo().abrirDialogoSiNo(
        '¿Subir items seleccionados?', 'Debes tener buena conexión a internet');

    if (dial == 0) {
      return;
    }

    try {
      workInProgress.value = true;
      await Future.delayed(const Duration(milliseconds: 300));

      await Future.wait(respuestaToUpload.map((r) async {
        final fileName = r.pathImagen.substring(r.pathImagen.lastIndexOf('/'));
        r.imgBase64String = await FileHelper.convertFileToBase64(r.pathImagen);
        r.pathImagen = '${BuildConfig.instance.config.imagesFolder}$fileName';
      }));
      final resp = await serverRepo.subirRespuestas(respuestaToUpload);
      workInProgress.value = false;

      resp.fold((l) => notif.mostrarInternalError(mensaje: l.mensaje),
          (r) async {
        await Future.wait(respuestaToUpload.map((r) async {
          await isar.setRespuestaSincronizado(r);
        }));

        int cantUploded = respuestaToUpload.length;
        respuestaToUpload = [];
        await getData();
        update();
        await DialogoSiNo().abrirDialogoSucccess('$cantUploded items subidos');
      });
    } catch (e) {
      print(e);
      workInProgress.value = false;
      notif.mostrarInternalError(mensaje: e.toString());
    }
  }
}
