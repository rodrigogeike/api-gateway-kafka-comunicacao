import 'package:flutter/foundation.dart';
import 'package:projeto/application/output/remote_output_category_model.dart';
import 'package:projeto/domain/entites/category_entity.dart';
import 'package:projeto/domain/helpers/domain_error.dart';
import 'package:projeto/domain/usecases/create_category.dart';
import 'package:projeto/infra/http/http_client.dart';
import 'package:projeto/infra/http/http_error.dart';

class RemoteCreateCategory implements CreateCategory {
  final HttpClient httpClient;
  final String url;

  RemoteCreateCategory({required this.httpClient, required this.url});

  Future<CategoryEntity> createCategory(CreateCategoryParams params) async {
    final body = RemoteCreateCategoryParams.fromDomain(params).toJson();
    try {
      final httpResponse =
          await httpClient.request(url: url, method: 'post', body: body);
      return RemoteOuputCategory.fromJson(httpResponse).toEntity();
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}

class RemoteCreateCategoryParams {
  final String name;

  RemoteCreateCategoryParams({
    required this.name,
  });

  factory RemoteCreateCategoryParams.fromDomain(CreateCategoryParams params) =>
      RemoteCreateCategoryParams(
        name: params.name,
      );

  Map toJson() => {
        'name': name,
      };
}
