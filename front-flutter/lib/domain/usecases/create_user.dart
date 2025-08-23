import 'package:equatable/equatable.dart';
import 'package:projeto/domain/entites/user_entity.dart';

abstract class CreateUser {
  Future<UserEntity> createUser(CreateUserParams params);
}

class CreateUserParams extends Equatable {
  final String email;
  final String name;
  final String password;
  final String passwordConfirmation;

  List get props => [email, name, password, passwordConfirmation];

  CreateUserParams(
      {required this.email,
      required this.name,
      required this.password,
      required this.passwordConfirmation});
}
