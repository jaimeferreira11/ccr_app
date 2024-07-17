import 'package:get/get.dart';

import 'bocas_controller.dart';

class BocasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BocasController());
  }
}
