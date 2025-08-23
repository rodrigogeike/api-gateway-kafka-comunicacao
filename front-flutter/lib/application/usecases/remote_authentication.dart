import 'package:projeto/application/output/remote_output_account_model.dart';
import 'package:projeto/domain/entites/account_entity.dart';
import 'package:projeto/domain/helpers/domain_error.dart';
import 'package:projeto/domain/usecases/authentication.dart';
import 'package:projeto/infra/http/http_client.dart';
import 'package:projeto/infra/http/http_error.dart';

class RemoteAuthentication implements Authentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({required this.httpClient, required this.url});

  Future<AccountEntity> auth(AuthenticationParams params) async {
    final body = RemoteAuthenticationParams.fromDomain(params).toJson();
    try {
      final httpResponse =
          await httpClient.request(url: url, method: 'post', body: body);
      return RemoteOuputAccount.fromJson(httpResponse).toEntity();
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}

class RemoteAuthenticationParams {
  final String email;
  final String password;

  RemoteAuthenticationParams({required this.email, required this.password});

  factory RemoteAuthenticationParams.fromDomain(AuthenticationParams params) =>
      RemoteAuthenticationParams(email: params.email, password: params.secret);

  Map toJson() => {'email': email, 'password': password};
}
