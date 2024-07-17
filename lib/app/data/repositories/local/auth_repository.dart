import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/errors/exceptions.dart';
import '../../../config/errors/failures.dart';
import '../../models/models.dart';
import '../../providers/local/cache.dart';

const cachedToken = "CACHED_TOKEN";
const cachedSync = "CACHED_SYNC";

class AuthRepository {
  // final _storage = new FlutterSecureStorage();
  final SharedPreferences sharedPreferences;

  AuthRepository(this.sharedPreferences);

  Future<Either<Failure, bool>> deleteAuthToken() async {
    try {
      // await _storage.deleteAll();
      await sharedPreferences.clear();
      return const Right(true);
    } on CacheException {
      return const Left(CacheFailure());
    }
  }

  Future<Either<Failure, TokenModel>> getAuthToken() async {
    try {
      // final jsonString = await _storage.read(key: CACHED_TOKEN);
      final jsonString = sharedPreferences.getString(cachedToken);
      if (jsonString == null) throw CacheException();
      TokenModel result = TokenModel.fromJson(json.decode(jsonString));
      Cache.instance.loginData = result;
      return Right(result);
    } catch (e) {
      log('$e');
      return const Left(CacheFailure());
    }
  }

  Future<Either<Failure, TokenModel>> setAuthToken(TokenModel model) async {
    try {
/*       await _storage.write(
          key: CACHED_TOKEN, value: json.encode(model.toJson())); */

      await sharedPreferences.setString(
          cachedToken, json.encode(model.toJson()));

      Cache.instance.loginData = model;
      return Right(model);
    } on CacheException {
      return const Left(CacheFailure());
    }
  }

  Future<Either<Failure, SyncModel>> getSyncData() async {
    try {
      final jsonString = sharedPreferences.getString(cachedSync);
      if (jsonString == null) throw CacheException();
      final model = SyncModel.fromJson(json.decode(jsonString));
      Cache.instance.syncData = model;
      return Right(model);
    } on CacheException {
      return const Left(CacheFailure());
    }
  }

  Future<Either<Failure, SyncModel>> setSyncData(SyncModel model) async {
    try {
      final String value = jsonEncode(model.toJson());
      await sharedPreferences.setString(cachedSync, value);
      Cache.instance.syncData = model;
      return Right(model);
    } on CacheException {
      return const Left(CacheFailure());
    }
  }

  Future<Either<Failure, bool>> deleteSyncData() async {
    try {
      await sharedPreferences.remove(cachedSync);
      return const Right(true);
    } on CacheException {
      return const Left(CacheFailure());
    }
  }
}
