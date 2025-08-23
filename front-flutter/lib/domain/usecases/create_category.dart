import 'package:equatable/equatable.dart';
import 'package:projeto/domain/entites/category_entity.dart';

abstract class CreateCategory {
  Future<CategoryEntity> createCategory(CreateCategoryParams params);
}

class CreateCategoryParams extends Equatable {
  final String name;

  List get props => [name];

  CreateCategoryParams({required this.name});
}
