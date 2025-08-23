import 'package:flutter/material.dart';
import 'package:projeto/pages/login/login_presentation.dart';
import 'package:provider/provider.dart';

class EmailInput extends StatelessWidget {
  Widget build(BuildContext context) {
    final LoginPresentation presentation =
        Provider.of<LoginPresentation>(context);
    return TextFormField(
      controller: presentation.email,
      decoration: InputDecoration(
        labelText: "Email",
        icon: Icon(Icons.email, color: Theme.of(context).primaryColorLight),
      ),
      keyboardType: TextInputType.emailAddress,
      // onChanged: presenter.validateEmail,
    );
  }
}
