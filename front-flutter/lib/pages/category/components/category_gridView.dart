import 'package:flutter/material.dart';
import 'package:projeto/pages/category/category_presentation.dart';
import 'package:provider/provider.dart';

class CategoryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryPresentation>(
      builder: (context, presentation, child) {
        return FutureBuilder(
          future: presentation.loadCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline,
                        size: 48, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      'Erro ao carregar categorias:\n${snapshot.error}',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => presentation.loadCategories(),
                      child: const Text('Tentar novamente'),
                    ),
                  ],
                ),
              );
            }

            if (presentation.categories.isEmpty) {
              return const Center(
                child: Text('Nenhuma categoria encontrada'),
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: presentation.categories.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final category = presentation.categories[index];
                return Card(
                  elevation: 2,
                  child: ListTile(
                    leading: const Icon(Icons.category),
                    title: Text(
                      category.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Add navigation or action here
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
