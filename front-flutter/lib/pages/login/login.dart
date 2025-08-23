import 'package:flutter/material.dart';
import 'package:projeto/pages/login/components/email_input.dart';
import 'package:projeto/pages/login/components/login_button.dart';
import 'package:projeto/pages/login/components/login_header.dart';
import 'package:projeto/pages/login/components/password_input.dart';
import 'package:projeto/pages/login/login_presentation.dart';
import 'package:projeto/pages/mixins/loading_manager.dart';
import 'package:projeto/pages/mixins/ui_error_manager.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget with LoadingManager, UIErrorManager {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresentation>(context);

    return Scaffold(
      body: Builder(builder: (context) {
        handleLoading(context, presenter.isLoading);
        handleMainError(context, presenter.mainError);
        return GestureDetector(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                LoginHeader(),
                Padding(
                  padding: EdgeInsets.all(32),
                  child: Form(
                    child: Column(children: <Widget>[
                      EmailInput(),
                      Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 32),
                        child: PasswordInput(),
                      ),
                      LoginButton(),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
