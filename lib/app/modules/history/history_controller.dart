import 'dart:developer';

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
      await Future.delayed(const Duration(milliseconds: 50));

      await Future.wait(respuestaToUpload.map((res) async {
        log('Colocando el path de ${res.imagenes.length} imagenes');
        await Future.wait((res.imagenes).map((img) async {
          final fileName =
              img.pathImagen.substring(img.pathImagen.lastIndexOf('/'));
          img.imgBase64String =
              await FileHelper.convertFileToBase64(img.pathImagen);
          img.pathImagenAux = String.fromCharCodes(img.pathImagen.codeUnits);

          img.pathImagen =
              '${BuildConfig.instance.config.imagesFolder}/${res.codBoca}$fileName';
        }));
      }));

      // subir entidad
      final resp = await serverRepo.subirRespuestas(respuestaToUpload);
      workInProgress.value = false;

      resp.fold((l) => notif.mostrarInternalError(mensaje: l.mensaje),
          (r) async {
        await Future.wait(respuestaToUpload.map((r) async {
          // volver a poner el path real a la lista de imagenes
          await Future.wait((r.imagenes).map((img) async {
            img.pathImagen = img.pathImagenAux ?? 'no-path';
          }));
          await isar.updateImagenesList(r.imagenes);
          // volver a poner el path real
          // r.pathImagen = r.pathImagenAux ?? 'no-path'; //! Este ya no se usa
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

  Future<void> deleteSincronizados() async {
    final dial = await DialogoSiNo().abrirDialogoSiNo(
        '¿Borrar relevos subidos del dispositivo?',
        'Esta acción no tiene es irreversible');

    if (dial == 0) {
      return;
    }

    int cantElimanadas = respuestasSubidas.length;

    workInProgress.value = true;
    await isar.deleteRespuestaSincronizadas();

    await getData();
    workInProgress.value = false;

    update();

    DialogoSiNo().abrirDialogoSucccess(
        '$cantElimanadas registros eliminados del dispotivo');
  }
}
