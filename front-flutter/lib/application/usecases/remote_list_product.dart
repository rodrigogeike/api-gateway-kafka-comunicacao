import 'package:projeto/application/output/remote_output_listproduct_model.dart';
import 'package:projeto/domain/entites/product_entity.dart';
import 'package:projeto/domain/helpers/domain_error.dart';
import 'package:projeto/domain/usecases/list_product.dart';
import 'package:projeto/infra/http/http_client.dart';
import 'package:projeto/infra/http/http_error.dart';

class RemoteListProduct implements ListProduct {
  final HttpClient httpClient;
  final String url;

  RemoteListProduct({required this.httpClient, required this.url});

  @override
  Future<List<ProductEntity>> listProduct(ListProductParams params) async {
    final body = RemoteListProductParams.fromDomain(params).toJson();
    try {
      final httpResponse = await httpClient.request(url: url, method: 'get');
      return RemoteOutputListProduct.fromJson(httpResponse).toEntityList();
    } on HttpError catch (error) {
      print(error);
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}

class RemoteListProductParams {
  final int page;
  final int limit;
  final String? search;
  final bool? paginate;

  RemoteListProductParams({
    required this.page,
    required this.limit,
    this.search,
    this.paginate,
  });

  factory RemoteListProductParams.fromDomain(ListProductParams params) =>
      RemoteListProductParams(
        page: params.page,
        limit: params.limit,
        search: params.search,
        paginate: params.paginate,
      );

  Map toJson() => {
        'page': page,
        'limit': limit,
        'search': search,
        'paginate': paginate,
      };
}
