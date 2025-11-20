import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto/domain/entites/product_entity.dart';
import 'package:projeto/domain/usecases/list_product.dart';

class ProductPresentation extends ChangeNotifier {
  List<ProductEntity> products = [];
  TextEditingController productDescription = TextEditingController();
  final ListProduct listProductRemote;

  ProductPresentation({required this.listProductRemote});

  Future<void> loadProducts() async {
    try {
      products = await listProductRemote
          .listProduct(ListProductParams(page: 1, limit: 10));
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
