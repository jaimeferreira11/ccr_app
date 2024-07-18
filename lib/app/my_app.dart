import 'package:ccr_app/flavors/enviroment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import 'config/theme/app_theme.dart';
import 'modules/splash/splash_binding.dart';
import 'modules/splash/splash_page.dart';
import 'routes/app_pages.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final EnvConfig _envConfig = BuildConfig.instance.config;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: _envConfig.appName,
      // debugShowCheckedModeBanner: false,

      debugShowCheckedModeBanner:
          _envConfig.environment.toString() == Environments.dev.toString(),
      // idioma
      locale: Get.deviceLocale,
      // supportedLocales: _getSupportedLocal(),
      theme: AppTheme().getTheme(),
      home: const SplashPage(),
      initialBinding: SplashBinding(),
      getPages: AppPage.pages,
    );
  }

  // List<Locale> _getSupportedLocal() {
  //   return [
  //     const Locale('en', ''),
  //     const Locale('es', ''),
  //   ];
  // }
}
