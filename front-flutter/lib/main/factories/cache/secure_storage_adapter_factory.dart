import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:projeto/infra/cache/secure_storage_adapter.dart';

SecureStorageAdapter makeSecureStorageAdapter() =>
    SecureStorageAdapter(secureStorage: FlutterSecureStorage());
