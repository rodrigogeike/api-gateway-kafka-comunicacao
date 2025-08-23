import 'package:projeto/domain/entites/account_entity.dart';
import 'package:projeto/domain/helpers/domain_error.dart';
import 'package:projeto/domain/repository/save_secure_cache_storage.dart';
import 'package:projeto/domain/usecases/save_current_account.dart';

class LocalSaveCurrentAccount implements SaveCurrentAccount {
  final SaveSecureCacheStorage saveSecureCacheStorage;

  LocalSaveCurrentAccount({required this.saveSecureCacheStorage});

  Future<void> save(AccountEntity account) async {
    try {
      await saveSecureCacheStorage.save(key: 'token', value: account.token);
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
