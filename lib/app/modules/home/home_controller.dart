import 'dart:async';

import 'package:ccr_app/app/data/models/sync_model.dart';
import 'package:ccr_app/app/data/providers/local/cache.dart';
import 'package:ccr_app/app/global_widgets/yes_no_dialog.dart';
import 'package:ccr_app/app/helpers/date_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/providers/local/db_isar.dart';
import '../../data/repositories/local/auth_repository.dart';
import '../../data/repositories/remote/server_repository.dart';
import '../../global_widgets/cambiar_password_widget.dart';
import '../../helpers/notifications/notificacion_service.dart';
import '../../helpers/notifications/notifications_keys.dart';
import '../../routes/app_routes.dart';
import '../../routes/navigator.dart';
import 'local_widgets/custom_drawer.dart';
import 'local_widgets/home_view.dart';

class HomeController extends GetxController {
  final nav = Get.find<NavigatorController>();
  final noti = Get.find<NotificationService>();
  final serverRepo = Get.find<ServerRepository>();
  final authRepo = Get.find<AuthRepository>();

  final isar = DBIsar();

  // StreamController<SyncModel> _streamController = StreamController<SyncModel>();
  // Stream<SyncModel> get streamController => _streamController.stream;

  // Stream<SyncModel> get stream => _streamController.stream.asBroadcastStream();

  //
  final BehaviorSubject<SyncModel> _streamController =
      BehaviorSubject<SyncModel>();

  Stream<SyncModel> get stream => _streamController.stream;

  void addDataToStream(SyncModel data) {
    _streamController.add(data);
  }

// Drawer
  int selectedDrawerIndex = 0;
  String title = "Inicio";
  Widget selectedView = const Text('Inicio');
  final drawerItems = [
    DrawerItem("Inicio", FontAwesomeIcons.house),
    // DrawerItem("Perfil", FontAwesomeIcons.userLarge),
    DrawerItem("Cambiar contraseña", FontAwesomeIcons.userLock),
    // DrawerItem("Ajustes", FontAwesomeIcons.gear),
    DrawerItem("Salir", FontAwesomeIcons.rightFromBracket)
  ];

  Widget currentPage = const HomeView();
  RxBool buscando = false.obs;

  // botom navigation
  final currentIndex = 0.obs;
  List pages = [
    {"page": const HomeView(), "title": "Inicio"},
    {"page": Container(), "title": "Nueva auditoría"},
    {"page": Container(), "title": "Trabajos realizados"},
    {"page": Container(), "title": "Ajustes"},
  ];

  @override
  void onReady() async {
    await getSyncData();
    update();

    if (!_streamController.hasListener) {
      _streamController.stream.listen((data) {
        Cache.instance.syncData = data;
        update();
        print("DataReceived: $data");
      }, onDone: () {
        print("Task Done");
      }, onError: (error) {
        print("Some Error");
      });
    }

    super.onReady();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  Future<void> getSyncData() async {
    final resp = await authRepo.getSyncData();
    resp.fold((l) async {
      final bocas = await isar.getBocas();
      if (bocas.isNotEmpty) {
        final syncData =
            SyncModel(download: DateHelper.dateToString(date: DateTime.now()));

        Cache.instance.syncData = syncData;
        addDataToStream(syncData);
      }
    }, (r) async {
      final count = await getPendientes();
      r.cantidadPendientes = count;
      Cache.instance.syncData = r;
      addDataToStream(r);
    });
  }

  Future<int> getPendientes() async {
    final list = await isar.getRespuestasByEstado(sincronizado: false);
    return list.length;
  }

  void changePage(int index) {
    currentIndex.value = index;
    currentPage = pages[currentIndex.value]['page'];
    title = pages[currentIndex.value]['title'];
    update();
  }

  onSelectItem(int index) {
    Get.back();

// limoiar pantalla password
    limpiarPantallaPass();
    switch (index) {
      case 0:
        title = "Inicio";
        selectedDrawerIndex = index;
        currentPage = const HomeView();
        update();
        break;
      case 1:
        title = "Cambiar contraseña";
        selectedDrawerIndex = index;
        currentPage = const CambiarPasswordWidget();
        update();
        break;
      case 2:
        launchDialogCerrarSesion();
        break;
      default:
        return const Text("Hola");
    }
    update();
  }

  // cambiar pass
  bool workInProgress = false;

  String? oldPassword;
  String? newPassword;
  String? repeatNewPassword;
  Map<String, TextEditingController> mapControllers = {
    "oldPassword": TextEditingController(),
    "newPassword": TextEditingController(),
    "repeatNewPassword": TextEditingController(),
  };
  Map<String, FocusNode> mapFocusNodes = {
    "oldPassword": FocusNode(),
    "newPassword": FocusNode(),
    "repeatNewPassword": FocusNode()
  };
  bool passwordVisible1 = false,
      passwordVisible2 = false,
      passwordVisible3 = false;
  RxBool ignore = false.obs;
  RxString errorPass = "".obs;

  limpiarPantallaPass() {
    passwordVisible1 = false;
    passwordVisible2 = false;
    passwordVisible3 = false;
    ignore.value = false;
    errorPass.value = "";
    oldPassword = "";
    newPassword = "";
    repeatNewPassword = "";
    mapControllers["oldPassword"]!.clear();
    mapControllers["newPassword"]!.clear();
    mapControllers["repeatNewPassword"]!.clear();
    update(['changePass']);
  }

  cambiarPass() async {
    if (newPassword == null ||
        repeatNewPassword == null ||
        oldPassword == null) {
      errorPass.value = "Completa los campos";
      return;
    }

    if (newPassword != repeatNewPassword) {
      errorPass.value = "Las nuevas contraseñas no coinciden";
      return;
    } else if (newPassword!.length < 6 || oldPassword!.length < 6) {
      errorPass.value = "Las contrasen1as deben tener al menos 6 caracteres";
      return;
    } else {
      errorPass.value = "";
    }

    try {
      ignore.value = true;

      final resp = await serverRepo.cambiarPassword(
          usuario: Cache.instance.loginData.usuario.usuario,
          oldPwd: oldPassword!,
          newPwd: newPassword!);

      ignore.value = false;
      resp.fold((l) {
        DialogoSiNo().abrirDialogoError(l.mensaje);
      }, (r) async {
        final model = Cache.instance.loginData.copyWith(
            usuario: Cache.instance.loginData.usuario
                .copyWith(password: newPassword));
        authRepo.setAuthToken(model);
        errorPass.value = "";
        limpiarPantallaPass();
        noti.mostrarSnackBar(
            color: NotiKey.success,
            mensaje: "Contraseña modificada correctamente",
            titulo: "Actualizado");
      });
    } catch (e) {
      ignore.value = false;
      print(e);
      DialogoSiNo().abrirDialogoError(e.toString());
    }
  }

  // Cerrar sesion
  Future<void> launchDialogCerrarSesion() async {
    Get.dialog(
        const AlertDialog(
          content: Text("Cerrando sesión...",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                  fontSize: 18.0,
                  color: Colors.black)),
        ),
        barrierDismissible: false);
    await cerrarSesion();
  }

  Future<void> cerrarSesion() async {
    // await serverRepo.logout();
    // await authRepo.deleteAuthToken();
    await authRepo.deleteAuthToken();

    Future.delayed(const Duration(milliseconds: 500), () {
      nav.back();
      nav.goToAndClean(AppRoutes.login);
    });
  }

  Future<bool> onWillPop(bool didPop) async {
    // final dialog =
    //     await DialogoSiNo().abrirDialogoSiNo('Desea salir de la app?', '');
    // if (dialog == 1) {
    //   Get.back();
    //   return true;
    // }
    return false;
  }

  SyncModel? syncData;
  Future<void> syncInfo() async {
    final res = await authRepo.getSyncData();

    res.fold((_) {}, (r) => syncData = r);
  }
}
