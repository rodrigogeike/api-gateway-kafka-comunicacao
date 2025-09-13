import 'package:projeto/domain/entites/category_entity.dart';
import 'package:projeto/infra/http/http_error.dart';

class RemoteOuputCategory {
  final int id;
  final String name;

  RemoteOuputCategory({
    required this.id,
    required this.name,
  });

  factory RemoteOuputCategory.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['name'])) {
      throw HttpError.invalidData;
    }
    return RemoteOuputCategory(
      id: json['id'],
      name: json['name'],
    );
  }

  CategoryEntity toEntity() => CategoryEntity(
        id: id,
        name: name,
      );
}
