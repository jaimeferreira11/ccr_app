import 'enviroment.dart';

class EnvConfig {
  final Environment environment;
  final String appName;
  final String baseUrl;
  final bool shouldCollectCrashLog;
  final String imagesFolder;

  EnvConfig({
    required this.appName,
    required this.baseUrl,
    required this.environment,
    required this.imagesFolder,
    this.shouldCollectCrashLog = false,
  });
}
