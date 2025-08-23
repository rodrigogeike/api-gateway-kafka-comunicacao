import 'package:flutter/material.dart';
import 'package:projeto/pages/category/category_presentation.dart';
import 'package:projeto/pages/user/user_presentation.dart';
import 'package:provider/provider.dart';

class CategoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<CategoryPresentation>(context);
    return ElevatedButton(
        onPressed: () async {
          await presenter.createCategory();
          Navigator.of(context).pushNamed("/category");
        },
        child: const Text("Salvar"));
  }
}
