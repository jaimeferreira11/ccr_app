import 'package:ccr_app/flavors/env_config.dart';
import 'package:ccr_app/main.dart';

import 'flavors/build_config.dart';

Future<void> mainCommon({required EnvConfig env}) async {
  BuildConfig.instantiate(
    envType: env.environment,
    envConfig: env,
  );

  main();
}
