import 'package:flutter/material.dart';
import 'package:projeto/pages/category/category_presentation.dart';
import 'package:projeto/pages/product/product_presentation.dart';
import 'package:provider/provider.dart';

class ProductInput extends StatelessWidget {
  Widget build(BuildContext context) {
    final ProductPresentation presentation =
        Provider.of<ProductPresentation>(context);
    return TextFormField(
      controller: presentation.productDescription,
      decoration: InputDecoration(
        labelText: "Descrição do Produto",
      ),
      keyboardType: TextInputType.text,
      // onChanged: presenter.validateEmail,
    );
  }
}
