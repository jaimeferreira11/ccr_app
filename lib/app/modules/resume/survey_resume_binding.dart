import 'package:get/get.dart';

import 'survey_resume_controller.dart';

class SurveyResumeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SurveyResumeController());
  }
}
