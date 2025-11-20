import 'package:flutter/material.dart';
import 'package:projeto/pages/product/product_presentation.dart';
import 'package:provider/provider.dart';

class ProductListView extends StatefulWidget {
  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final presentation =
        Provider.of<ProductPresentation>(context, listen: false);
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await presentation.loadProducts();
    } catch (e) {
      setState(() {
        _errorMessage = 'Erro ao carregar produtos: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductPresentation>(
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
                  onPressed: _loadProducts,
                  child: const Text('Tentar novamente'),
                ),
              ],
            ),
          );
        }

        if (presentation.products == null || presentation.products.isEmpty) {
          return const Center(
            child: Text('Nenhum produto encontrado'),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          itemCount: presentation.products.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final product = presentation.products[index];
            return Card(
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: Text(
                  product.description,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  product.description ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Add navigation or action here for the product
                },
              ),
            );
          },
        );
      },
    );
  }
}
