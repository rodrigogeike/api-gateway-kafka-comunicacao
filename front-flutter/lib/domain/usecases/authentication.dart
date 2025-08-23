import 'package:equatable/equatable.dart';
import 'package:projeto/domain/entites/account_entity.dart';

abstract class Authentication {
  Future<AccountEntity> auth(AuthenticationParams params);
}

class AuthenticationParams extends Equatable {
  final String email;
  final String secret;

  List get props => [email, secret];

  AuthenticationParams({required this.email, required this.secret});
}
