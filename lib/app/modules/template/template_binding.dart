import 'package:get/get.dart';

import 'template_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TemplateController());
  }
}
