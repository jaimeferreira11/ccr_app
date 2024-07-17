import 'package:get/get.dart';

class NavigatorController {
  void goToOff(String route,
      {Map<String, String>? arguments, Map<String, String>? parameters}) {
    Get.offNamed(route, arguments: arguments, parameters: parameters);
  }

  void goToAndClean(String route) {
    Get.offAllNamed(route);
  }

  void goTo(String route,
      {Map<String, dynamic>? arguments, Map<String, String>? parameters}) {
    Get.toNamed(route, arguments: arguments, parameters: parameters);
  }

  void goToPdf(String route, String pdf) {
    Get.toNamed(route, arguments: {'path': pdf});
  }

  void back() {
    Get.back();
  }
}
