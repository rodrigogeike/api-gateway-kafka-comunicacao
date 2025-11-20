import 'package:equatable/equatable.dart';
import 'package:projeto/domain/entites/product_entity.dart';

abstract class ListProduct {
  Future<List<ProductEntity>> listProduct(ListProductParams params);
}

class ListProductParams extends Equatable {
  final int page;
  final int limit;
  final String? search;
  final bool? paginate;

  List get props => [page, limit, search, paginate];

  ListProductParams({
    required this.page,
    required this.limit,
    this.search,
    this.paginate,
  });
}
