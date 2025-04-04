// lib/features/auth/data/datasources/local_storage_data_source.dart

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class LocalStorageDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}

class LocalStorageDataSourceImpl implements LocalStorageDataSource {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  Future<void> saveToken(String token) async {
    await storage.write(key: 'auth_token', value: token);
  }

  @override
  Future<String?> getToken() async {
    return await storage.read(key: 'auth_token');
  }

  @override
  Future<void> deleteToken() async {
    await storage.delete(key: 'auth_token');
  }
}