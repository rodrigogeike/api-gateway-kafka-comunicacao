import 'package:flutter/material.dart';
import 'package:projeto/pages/category/category_presentation.dart';
import 'package:projeto/pages/category/components/category_button.dart';
import 'package:projeto/pages/category/components/category_gridView.dart';
import 'package:projeto/pages/category/components/category_input.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Categorias'),
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
                      child: CategoryListView(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: CategoryInput(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1, bottom: 20),
                      child: CategoryButton(),
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
