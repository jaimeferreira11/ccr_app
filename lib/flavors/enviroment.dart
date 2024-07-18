import 'env_config.dart';

enum Environment { dev, test, prod }

class Environments {
  static EnvConfig get dev => EnvConfig(
      environment: Environment.dev,
      appName: "Zoomin (Dev)",
      baseUrl: "http://192.168.100.67:8080/ccr-rest-api/", // local
      shouldCollectCrashLog: true,
      imagesFolder: 'zoomin-bebidas');

  static EnvConfig get test => EnvConfig(
      environment: Environment.test,
      appName: "CCR Zoomin (Test)",
      baseUrl: "http://10.0.0.160:8051/ccr-rest-api/", // test
      shouldCollectCrashLog: true,
      imagesFolder: 'zoomin-bebidas');

  static EnvConfig get prod => EnvConfig(
      environment: Environment.prod,
      appName: "Zoomin",
      baseUrl: "http://200.108.131.206:8051/ccr-rest-api/", // produccion
      shouldCollectCrashLog: true,
      imagesFolder: 'zoomin-bebidas');
}
