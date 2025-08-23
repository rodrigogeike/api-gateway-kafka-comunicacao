import 'package:projeto/application/usecases/local_save_current_account.dart';
import 'package:projeto/domain/usecases/save_current_account.dart';
import 'package:projeto/main/factories/cache/secure_storage_adapter_factory.dart';

SaveCurrentAccount makeLocalSaveCurrentAccount() =>
    LocalSaveCurrentAccount(saveSecureCacheStorage: makeSecureStorageAdapter());
