import 'package:flutter/material.dart';
import 'package:projeto/pages/user/components/user_button.dart';
import 'package:projeto/pages/user/components/user_email_input.dart';
import 'package:projeto/pages/user/components/user_gridView.dart';
import 'package:projeto/pages/user/components/user_name_input.dart';
import 'package:projeto/pages/user/components/user_passowrd_confirm_input.dart';
import 'package:projeto/pages/user/components/user_password_input.dart';

class UserPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastar Usuario'),
      ),
      body: GestureDetector(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 20),
                      child: UserGridView(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: UserEmailInput(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1, bottom: 20),
                      child: UserNameInput(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1, bottom: 20),
                      child: UserPasswordInput(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1, bottom: 20),
                      child: UserPasswordConfirmInput(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1, bottom: 20),
                      child: UserButton(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
