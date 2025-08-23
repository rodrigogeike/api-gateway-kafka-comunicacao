import 'package:projeto/domain/entites/account_entity.dart';
import 'package:projeto/infra/http/http_error.dart';

class RemoteOuputAccount {
  final String accessToken;

  RemoteOuputAccount({required this.accessToken});

  factory RemoteOuputAccount.fromJson(Map json) {
    if (!json.containsKey('token')) {
      throw HttpError.invalidData;
    }
    return RemoteOuputAccount(accessToken: json['token']);
  }

  AccountEntity toEntity() => AccountEntity(token: accessToken);
}
