import 'package:flutter/material.dart';
import 'package:projeto/pages/user/user_presentation.dart';
import 'package:provider/provider.dart';

class UserNameInput extends StatelessWidget {
  Widget build(BuildContext context) {
    final UserPresentation presentation =
        Provider.of<UserPresentation>(context);
    return TextFormField(
      controller: presentation.name,
      decoration: InputDecoration(
        labelText: "Nome",
        icon: Icon(Icons.insert_comment_sharp,
            color: Theme.of(context).primaryColorLight),
      ),
      keyboardType: TextInputType.emailAddress,
      // onChanged: presenter.validateEmail,
    );
  }
}
