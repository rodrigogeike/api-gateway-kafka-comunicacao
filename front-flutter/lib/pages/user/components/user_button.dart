import 'package:flutter/material.dart';
import 'package:projeto/pages/user/user_presentation.dart';
import 'package:provider/provider.dart';

class UserButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<UserPresentation>(context);
    return ElevatedButton(
        onPressed: () async {
          await presenter.createUser();
          Navigator.of(context).pushNamed("/home");
        },
        child: const Text("Salvar"));
  }
}
