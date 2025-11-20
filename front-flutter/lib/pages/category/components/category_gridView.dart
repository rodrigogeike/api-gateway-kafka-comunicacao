import 'package:flutter/material.dart';
import 'package:projeto/pages/category/category_presentation.dart';
import 'package:provider/provider.dart';

class CategoryListView extends StatefulWidget {
  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    final presentation =
        Provider.of<CategoryPresentation>(context, listen: false);
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await presentation.loadCategories();
    } catch (e) {
      setState(() {
        _errorMessage = 'Erro ao carregar categorias: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryPresentation>(
      builder: (context, presentation, child) {
        if (_isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (_errorMessage != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  _errorMessage!,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _loadCategories,
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
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
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
  }
}
