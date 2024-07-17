import 'package:get/get.dart';

import 'download_controller.dart';

class DownloadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DownloadController());
  }
}
