import 'package:projeto/application/output/remote_output_user_model.dart';
import 'package:projeto/domain/entites/user_entity.dart';
import 'package:projeto/domain/helpers/domain_error.dart';
import 'package:projeto/domain/usecases/create_user.dart';
import 'package:projeto/infra/http/http_client.dart';
import 'package:projeto/infra/http/http_error.dart';

class RemoteCreateUser implements CreateUser {
  final HttpClient httpClient;
  final String url;

  RemoteCreateUser({required this.httpClient, required this.url});

  Future<UserEntity> createUser(CreateUserParams params) async {
    final body = RemoteCreateUserParams.fromDomain(params).toJson();
    try {
      final httpResponse =
          await httpClient.request(url: url, method: 'post', body: body);
      return RemoteOuputUser.fromJson(httpResponse).toEntity();
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}

class RemoteCreateUserParams {
  final String email;
  final String name;
  final String password;
  final String passwordConfirmation;

  RemoteCreateUserParams(
      {required this.email,
      required this.name,
      required this.password,
      required this.passwordConfirmation});

  factory RemoteCreateUserParams.fromDomain(CreateUserParams params) =>
      RemoteCreateUserParams(
          email: params.email,
          name: params.name,
          password: params.password,
          passwordConfirmation: params.passwordConfirmation);

  Map toJson() => {
        'email': email,
        'name': email,
        'password': password,
        'passwordConfirmation': password
      };
}
