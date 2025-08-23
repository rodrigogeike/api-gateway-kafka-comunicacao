import 'package:flutter/foundation.dart';
import 'package:projeto/application/output/remote_output_category_model.dart';
import 'package:projeto/domain/entites/category_entity.dart';
import 'package:projeto/infra/http/http_error.dart';

class RemoteOutputListCategory {
  final List<RemoteOuputCategory> categories;

  RemoteOutputListCategory({
    required this.categories,
  });

  factory RemoteOutputListCategory.fromJson(List<dynamic> jsonList) {
    if (jsonList.isEmpty) {
      throw HttpError.invalidData;
    }
    return RemoteOutputListCategory(
      categories: jsonList
          .map((json) => RemoteOuputCategory.fromJson(json))
          .toList(),
    );
  }
    List<CategoryEntity> toEntityList() {
    return categories.map((category) => category.toEntity()).toList();
  }
}
