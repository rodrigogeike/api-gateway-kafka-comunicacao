import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String password;
  final String passwordConfirmation;

  List get props => [email, name, password, passwordConfirmation];
  UserEntity(
      {required this.id,
      required this.email,
      required this.name,
      required this.password,
      required this.passwordConfirmation});
}
