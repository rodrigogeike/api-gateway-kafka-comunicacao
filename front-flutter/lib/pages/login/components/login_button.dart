import 'package:flutter/material.dart';
import 'package:projeto/pages/login/login_presentation.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresentation>(context);
    return ElevatedButton(
        onPressed: () async {
          Navigator.of(context).pushNamed("/home");
          //    final isAuthentication = await presenter.auth();
          //    if (presenter.isAuthetication == true) {
          //     Navigator.of(context).pushNamed("/home");
          //   }
        },
        child: const Text("Acessar"));
  }
}
