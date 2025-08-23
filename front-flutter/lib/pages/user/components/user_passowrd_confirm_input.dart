import 'package:flutter/material.dart';
import 'package:projeto/pages/user/user_presentation.dart';
import 'package:provider/provider.dart';

class UserPasswordConfirmInput extends StatelessWidget {
  Widget build(BuildContext context) {
    final UserPresentation presentation =
        Provider.of<UserPresentation>(context);
    return TextFormField(
      controller: presentation.passwordConfirmation,
      decoration: InputDecoration(
          labelText: "Password Confirm",
          icon: Icon(Icons.lock, color: Theme.of(context).primaryColorLight),
          errorText: "Erro password"),
      obscureText: true,
    );
  }
}


