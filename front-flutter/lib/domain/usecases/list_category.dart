import 'package:equatable/equatable.dart';
import 'package:projeto/domain/entites/category_entity.dart';
import 'package:projeto/domain/entites/user_entity.dart';

abstract class ListCategory {
  Future<List<CategoryEntity>> listCategory(ListCategoryParams params);
}

class ListCategoryParams extends Equatable {
  final int page;
  final int limit;
  final String search;
  final bool paginate;

  List get props => [page, limit, search, paginate];

  ListCategoryParams(
      {required this.page,
      required this.limit,
      required this.search,
      required this.paginate});
}
