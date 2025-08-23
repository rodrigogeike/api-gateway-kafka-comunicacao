import 'package:flutter/material.dart';

showErrorMessage(BuildContext context, String error) {
  Future.delayed(Duration.zero, () {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.red[900],
      content: Text(error, textAlign: TextAlign.center),
    ));
  });
  ;
}
