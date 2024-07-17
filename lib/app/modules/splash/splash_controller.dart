import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../data/providers/local/cache.dart';
import '../../data/repositories/local/auth_repository.dart';
import '../../data/repositories/remote/server_repository.dart';
import '../../helpers/utils.dart';
import '../../routes/app_routes.dart';
import '../../routes/navigator.dart';

class SplashController extends GetxController {
  final authRepo = Get.find<AuthRepository>();
  final serverRepo = Get.find<ServerRepository>();
  final nav = Get.find<NavigatorController>();

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {
    final res = await authRepo.getSyncData();

    res.fold((l) {}, (r) {
      Cache.instance.syncData = r;
      update();
    });

    // final checkIsConnected = await Utils.checkConnection(false);
    // if (!checkIsConnected) {
    //   return Get.offAll(() => WarningView(
    //         text:
    //             'Su dispositivo no tiene acceso a internet. Favor, verifique su conexión',
    //         isButtonRequired: true,
    //         buttonText: 'Aceptar',
    //         onButtonPressed: () => nav.goToAndClean(AppRoutes.splash),
    //       ));
    // }

    verificarSesion();

    // final resp = await serverRepo.getVersion();

    // resp.fold((l) => verificarSesion(), (r) async {
    //   final PackageInfo info = await PackageInfo.fromPlatform();

    //   final localVersion = int.parse(info.buildNumber);
    //   print('version en el server: $r');
    //   print('version local: $localVersion');
    //   if (r > localVersion) {
    //     Get.offAll(NewVersionView());
    //     return;
    //   } else {
    //     Cache.instance.version = info.version;
    //     verificarSesion();
    //   }
    // });

    await [
      Permission.location,
      Permission.locationWhenInUse,
      Permission.phone,
      Permission.camera,
      Permission.storage,
      Permission.photos
    ].request();
    await verifyLocation();

    final PackageInfo info = await PackageInfo.fromPlatform();
    Cache.instance.version = info.version;
  }

  Future verificarSesion() async {
    final respuesta = await authRepo.getAuthToken();

    respuesta.fold(
      (l) => Future.delayed(
        const Duration(milliseconds: 500),
        () {
          nav.goToOff(AppRoutes.login);
        },
      ),
      (r) => Future.delayed(
        const Duration(milliseconds: 500),
        () async {
          nav.goToAndClean(AppRoutes.home);
          Cache.instance.loginData = r;
          // Cache.instance.usuario = r.usuario;

          //! No se verifica la validez del token
          // final resSession = await serverRepo.verfificarSession();
          // resSession.fold((l) {
          //   authRepo.deleteAuthToken();
          //   authRepo.deleteUsuario();
          //   nav.goToOff(AppRoutes.LOGIN);
          // }, (r) async {
          //   if (r.tipobeneficiario < 100) {
          //     nav.goToOff(AppRoutes.LOGIN);
          //     return;
          //   }
          //   await authRepo.setUsuario(r);

          //   nav.goToAndClean(AppRoutes.HOME);
          // });
        },
      ),
    );
  }

  Future verifyLocation() async {
    final result = await Utils.acquireCurrentLocation();
    if (result != null) {
      Cache.instance.currentLocation = result;
    }
  }
}
