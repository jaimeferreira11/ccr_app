import 'package:ccr_app/app/helpers/notifications/notificacion_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/models.dart';
import '../../data/providers/local/db_isar.dart';
import '../../data/repositories/local/auth_repository.dart';
import '../../data/repositories/remote/server_repository.dart';
import '../../routes/navigator.dart';

class BocasController extends GetxController {
  final authRepo = Get.find<AuthRepository>();
  final serverRepo = Get.find<ServerRepository>();
  final nav = Get.find<NavigatorController>();
  final notif = Get.find<NotificationService>();
  final isar = DBIsar();

  RxBool workInProgress = false.obs;
  ScrollController scrollController = ScrollController();

  List<BocaModel> bocas = [];
  List<String> ciudades = ['Todas'];
  String term = '';
  String ciudadSeleccionada = 'Todas';

  bool isLoaging = false;
  bool isInitial = true;
  bool isSerched = false;
  int page = 0;

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {
    workInProgress.value = true;

    final ciud = await isar.getCiudades();
    ciudades = ['Todas', ...ciud];
    // await getBocas();
    update();
    workInProgress.value = false;
  }

  Future<void> getBocas(
      {String term = '', String ciudad = '', int offset = 0}) async {
    isLoaging = true;
    if (term.isNotEmpty) {
      isSerched = true;
    } else {
      isSerched = false;
    }
    update();
    bocas = [
      ...bocas,
      ...await isar.getBocas(term: term, ciudad: ciudad, offset: offset)
    ];
    isLoaging = false;
    update();
  }

  Future<void> filter() async {
    workInProgress.value = true;
    isLoaging = true;
    if (ciudadSeleccionada == 'Todas') {
      isInitial = true;
    } else {
      isInitial = false;
    }

    final ciudad = ciudadSeleccionada == 'Todas' ? '' : ciudadSeleccionada;
    bocas = [];
    await getBocas(term: term, ciudad: ciudad);

    workInProgress.value = false;
    isLoaging = false;

    update();
  }

  void clearForm() {
    isInitial = true;
    isLoaging = false;
    isSerched = false;
    page = 0;
    ciudadSeleccionada = 'Todas';
    term = '';
    bocas = [];
    // getBocas();
  }

  Future<bool> estaRelevado(int idBoca) async {
    final boca = await isar.findBocaById(idBoca);

    return boca?.estaRelevado ?? false;
  }
}
