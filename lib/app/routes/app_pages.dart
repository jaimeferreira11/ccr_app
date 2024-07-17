import 'package:ccr_app/app/modules/bocas/bocas_binding.dart';
import 'package:ccr_app/app/modules/bocas/bocas_page.dart';
import 'package:ccr_app/app/modules/download/download_binding.dart';
import 'package:ccr_app/app/modules/download/download_page.dart';
import 'package:ccr_app/app/modules/history/history_binding.dart';
import 'package:ccr_app/app/modules/history/history_page.dart';
import 'package:ccr_app/app/modules/new_survey/new_survey_binding.dart';
import 'package:ccr_app/app/modules/new_survey/survey_photo_page.dart';
import 'package:ccr_app/app/modules/resume/survey_resume_binding.dart';
import 'package:ccr_app/app/modules/resume/survey_resume_page.dart';
import 'package:get/route_manager.dart';

import '../modules/home/home_bindings.dart';
import '../modules/home/home_page.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_page.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_page.dart';
import 'app_routes.dart';

class AppPage {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.home,
        page: () => const HomePage(),
        binding: HomeBindings()),
    GetPage(
        name: AppRoutes.download,
        page: () => const DownloadPage(),
        binding: DownloadBinding()),
    GetPage(
        name: AppRoutes.history,
        page: () => const HistoryPage(),
        binding: HistoryBinding()),
    GetPage(
        name: AppRoutes.bocas,
        page: () => const BocasPage(),
        binding: BocasBinding()),
    GetPage(
        name: AppRoutes.newSurvey,
        page: () => const SurveyPhotoPage(),
        binding: NewSurveyBinding()),
    GetPage(
        name: AppRoutes.resumeSurvey,
        page: () => const SurveyResumePage(),
        binding: SurveyResumeBinding()),
  ];
}
