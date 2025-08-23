import 'package:localstorage/localstorage.dart';
import 'package:projeto/domain/repository/cache_storage.dart';

class LocalStorageAdapter implements CacheStorage {
  final LocalStorage localStorage;

  LocalStorageAdapter({required this.localStorage});

  Future<void> save({required String key, required dynamic value}) async {
    localStorage.setItem(key, value);
  }

  Future<void> delete(String key) async {}

  Future<dynamic> fetch(String key) async {
    return localStorage.getItem(key);
  }
}
