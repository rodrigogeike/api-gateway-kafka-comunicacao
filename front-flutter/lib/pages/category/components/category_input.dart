import 'package:flutter/material.dart';
import 'package:projeto/pages/category/category_presentation.dart';
import 'package:provider/provider.dart';

class CategoryInput extends StatelessWidget {
  Widget build(BuildContext context) {
    final CategoryPresentation presentation =
        Provider.of<CategoryPresentation>(context);
    return TextFormField(
      controller: presentation.categoryName,
      decoration: InputDecoration(
        labelText: "Descrição categoria",
      ),
      keyboardType: TextInputType.emailAddress,
      // onChanged: presenter.validateEmail,
    );
  }
}
