
import 'package:projeto/application/output/remote_output_listcategory_model.dart';
import 'package:projeto/domain/entites/category_entity.dart';
import 'package:projeto/domain/helpers/domain_error.dart';

import 'package:projeto/domain/usecases/list_category.dart';
import 'package:projeto/infra/http/http_client.dart';
import 'package:projeto/infra/http/http_error.dart';

class RemoteListCategory implements ListCategory {
  final HttpClient httpClient;
  final String url;

  RemoteListCategory({required this.httpClient, required this.url});

  Future<List<CategoryEntity>> listCategory(ListCategoryParams params) async {
    final body = RemoteListCategoryParams.fromDomain(params).toJson();
    try {
      final httpResponse =
          await httpClient.request(url: url, method: 'post', body: body);
      return RemoteOutputListCategory.fromJson(httpResponse).toEntityList();
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}

class RemoteListCategoryParams {
  final int page;
  final int limit;
  final String search;
  final bool paginate;

  RemoteListCategoryParams(
      {required this.page,
      required this.limit,
      required this.search,
      required this.paginate});

  factory RemoteListCategoryParams.fromDomain(ListCategoryParams params) =>
      RemoteListCategoryParams(
          page: params.page,
          limit: params.limit,
          search: params.search,
          paginate: params.paginate);

  Map toJson() =>
      {'page': page, 'limit': limit, 'search': search, 'paginate': paginate};
}
