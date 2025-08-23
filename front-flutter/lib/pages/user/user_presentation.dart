import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto/domain/entites/user_entity.dart';
import 'package:projeto/domain/usecases/create_user.dart';

class UserPresentation extends ChangeNotifier {
  final CreateUser userRemote;
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirmation = TextEditingController();

  UserPresentation({required this.userRemote});

  Future<void> createUser() async {
    try {
      await userRemote.createUser(CreateUserParams(
          email: email.text,
          name: name.text,
          password: password.text,
          passwordConfirmation: passwordConfirmation.text));
    } catch (e) {
      print(e);
    }
  }
}
