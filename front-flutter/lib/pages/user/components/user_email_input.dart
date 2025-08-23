import 'package:flutter/material.dart';
import 'package:projeto/pages/user/user_presentation.dart';
import 'package:provider/provider.dart';

class UserEmailInput extends StatelessWidget {
  Widget build(BuildContext context) {
    final UserPresentation presentation =
        Provider.of<UserPresentation>(context);
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
