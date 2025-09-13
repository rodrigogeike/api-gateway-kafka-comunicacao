import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto/domain/entites/category_entity.dart';
import 'package:projeto/domain/usecases/create_category.dart';
import 'package:projeto/domain/usecases/list_category.dart';

class CategoryPresentation extends ChangeNotifier {
  final CreateCategory categoryRemote;
  final ListCategory listCategoryRemote;
  final List<CategoryEntity> categories = [];
  TextEditingController categoryName = TextEditingController();

  CategoryPresentation(
      {required this.categoryRemote, required this.listCategoryRemote});

  Future<void> createCategory() async {
    try {
      await categoryRemote
          .createCategory(CreateCategoryParams(name: categoryName.text));
    } catch (e) {
      print(e);
    }
  }

  Future<void> loadCategories() async {
    try {
      List<CategoryEntity> categories = await listCategoryRemote
          .listCategory(ListCategoryParams(page: 1, limit: 10));
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
