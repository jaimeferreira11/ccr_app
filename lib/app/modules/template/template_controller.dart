import 'package:get/get.dart';

import '../../data/repositories/local/auth_repository.dart';
import '../../data/repositories/remote/server_repository.dart';
import '../../routes/navigator.dart';

class TemplateController extends GetxController {
  final authRepo = Get.find<AuthRepository>();
  final serverRepo = Get.find<ServerRepository>();
  final nav = Get.find<NavigatorController>();
  RxBool workInProgress = false.obs;

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {}
}
