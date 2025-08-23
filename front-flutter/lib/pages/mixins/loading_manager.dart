import 'package:flutter/material.dart';
import 'package:projeto/pages/components/showLoading.dart';

mixin LoadingManager {
  void handleLoading(BuildContext context, bool? isLoading) {
    if (isLoading == true) {
      showLoading(context);
    } else {
      hideLoading(context);
    }
  }
}
