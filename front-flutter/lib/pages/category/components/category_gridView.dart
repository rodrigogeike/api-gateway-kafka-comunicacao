import 'package:flutter/material.dart';

class CategoryGridview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Cria um grid com duas colunas
      crossAxisCount: 2,
      // Gera 100 Widgets que exibem o seu índice
      children: List.generate(100, (index) {
        return Center(
          child: Text(
            'Item $index',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        );
      }),
    );
  }
}
