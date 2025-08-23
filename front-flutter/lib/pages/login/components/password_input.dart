import 'package:flutter/material.dart';
import 'package:projeto/pages/login/login_presentation.dart';
import 'package:provider/provider.dart';

class PasswordInput extends StatelessWidget {
  Widget build(BuildContext context) {
    LoginPresentation presentation = Provider.of<LoginPresentation>(context);
    return TextFormField(
      controller: presentation.secret,
      decoration: InputDecoration(
          labelText: "Password",
          icon: Icon(Icons.lock, color: Theme.of(context).primaryColorLight),
          errorText: "Erro password"),
      obscureText: true,
    );
  }
}
