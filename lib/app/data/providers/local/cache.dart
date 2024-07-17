import 'package:location/location.dart';

import '../../models/models.dart';

class Cache {
  static Cache? _instance;

  Cache._();

  static Cache get instance => _instance ??= Cache._();

  late TokenModel loginData;
  // late UsuarioModel usuario;

  LocationData? currentLocation;
  late String version;
  SyncModel? syncData;
}
