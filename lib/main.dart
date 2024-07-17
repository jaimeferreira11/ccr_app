import 'package:ccr_app/app/data/providers/local/db_isar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/config/dependencies/dependency_injection.dart';
import 'app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependecyInjection.init();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  if (!kIsWeb) {
    // inti fcm services
    // await FcmHelper.initFcm();
    // initialize local notifications service
    // await AwesomeNotificationsHelper.init();
  }

  DBIsar();

  initializeDateFormatting('es', null);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      const MyApp(),
    ),
  );
}
