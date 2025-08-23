import 'package:flutter/material.dart';
import 'package:projeto/pages/user/user_presentation.dart';
import 'package:provider/provider.dart';

class UserPasswordInput extends StatelessWidget {
  Widget build(BuildContext context) {
    final UserPresentation presentation =
        Provider.of<UserPresentation>(context);
    return TextFormField(
      controller: presentation.password,
      decoration: InputDecoration(
          labelText: "Password",
          icon: Icon(Icons.lock, color: Theme.of(context).primaryColorLight),
          errorText: "Erro password"),
      obscureText: true,
    );
  }
}
