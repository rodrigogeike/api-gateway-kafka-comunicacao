import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto/pages/product/components/product_gridView.dart';
import 'package:projeto/pages/product/components/product_input.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de produto'),
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
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: ProductListView(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: ProductInput(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1, bottom: 20),
                      child: ProductInput(),
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
