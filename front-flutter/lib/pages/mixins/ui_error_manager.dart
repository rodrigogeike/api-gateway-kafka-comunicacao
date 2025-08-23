import 'package:flutter/material.dart';
import 'package:projeto/pages/components/error_message.dart';
import 'package:projeto/pages/helpers/errors/ui_error.dart';

mixin UIErrorManager {
  void handleMainError(BuildContext context, UIError? error) {
    if (error != null) {
      showErrorMessage(context, error.description);
    }
  }
}
