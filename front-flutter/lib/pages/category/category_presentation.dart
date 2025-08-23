import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto/domain/usecases/create_category.dart';

class CategoryPresentation extends ChangeNotifier {
  final CreateCategory categoryRemote;
  TextEditingController categoryName = TextEditingController();

  CategoryPresentation({required this.categoryRemote});

  Future<void> createCategory() async {}
}
