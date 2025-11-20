import 'package:projeto/domain/entites/product_entity.dart';

class RemoteOutputListProduct {
  final List<RemoteOutputProductModel> data;

  RemoteOutputListProduct({required this.data});

  factory RemoteOutputListProduct.fromJson(Map json) {
    var productList = <RemoteOutputProductModel>[];
    if (json['data'] != null && json['data'] is List) {
      productList = (json['data'] as List)
          .map((e) => RemoteOutputProductModel.fromJson(e))
          .toList();
    }
    return RemoteOutputListProduct(data: productList);
  }

  List<ProductEntity> toEntityList() {
    return data.map((model) => model.toEntity()).toList();
  }
}

class RemoteOutputProductModel {
  final int id;
  final String description;

  RemoteOutputProductModel({required this.id, required this.description});

  factory RemoteOutputProductModel.fromJson(Map json) {
    return RemoteOutputProductModel(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      description: json['description'] ?? '',
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(id: id, description: description);
  }
}
