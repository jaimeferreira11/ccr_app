import 'package:get/get.dart';

import 'new_survey_controller.dart';

class NewSurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewSurveyController());
  }
}
