import 'package:flutter/material.dart';
import 'package:projeto/domain/helpers/domain_error.dart';
import 'package:projeto/domain/usecases/authentication.dart';
import 'package:projeto/domain/usecases/save_current_account.dart';
import 'package:projeto/infra/cache/local_storage_adapter.dart';
import 'package:projeto/pages/helpers/errors/ui_error.dart';
import 'package:projeto/pages/validators/protocols/validation.dart';

class LoginPresentation extends ChangeNotifier {
  final Authentication authentication;
  bool? isLoading = false;
  UIError? mainError;
  final SaveCurrentAccount saveCurrentAccount;
  bool? isAuthetication = false;

  TextEditingController email = TextEditingController();
  TextEditingController secret = TextEditingController();

  LoginPresentation(
      {required this.authentication,
      required,
      required this.saveCurrentAccount});

  Future<void> auth() async {
    try {
      mainError = null;
      activeLoad();
      final account = await authentication
          .auth(AuthenticationParams(email: email.text, secret: secret.text));
      await saveCurrentAccount.save(account);
      isAuthetication = true;
      desativeLoad();
    } on DomainError catch (error) {
      switch (error) {
        case DomainError.invalidCredentials:
          mainError = UIError.invalidCredentials;
          break;
        default:
          mainError = UIError.unexpected;
          break;
      }
      desativeLoad();
    }
  }

  void activeLoad() {
    isLoading = true;
    notifyListeners();
  }

  void desativeLoad() {
    isLoading = false;
    notifyListeners();
  }
}
