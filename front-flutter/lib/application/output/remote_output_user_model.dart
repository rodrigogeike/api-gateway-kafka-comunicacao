import 'package:projeto/domain/entites/user_entity.dart';
import 'package:projeto/infra/http/http_error.dart';

class RemoteOuputUser {
  final String id;
  final String email;
  final String name;
  final String password;
  final String passwordConfirmation;

  RemoteOuputUser(
      {required this.id,
      required this.email,
      required this.name,
      required this.password,
      required this.passwordConfirmation});

  factory RemoteOuputUser.fromJson(Map json) {
    if (!json.keys
        .toSet()
        .containsAll(['id', 'email', 'password', 'passwordConfirmation'])) {
      throw HttpError.invalidData;
    }
    return RemoteOuputUser(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        password: json['password'],
        passwordConfirmation: json['passwordConfirmation']);
  }

  UserEntity toEntity() => UserEntity(
        id: id,
        email: email,
        name: name,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
}
