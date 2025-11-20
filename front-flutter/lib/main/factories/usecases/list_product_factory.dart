import 'package:projeto/application/usecases/remote_list_product.dart';
import 'package:projeto/domain/usecases/list_product.dart';
import 'package:projeto/main/factories/http/api_url_factory.dart';
import 'package:projeto/main/factories/http/http_client_factory.dart';

ListProduct makeRemoteListProduct() => RemoteListProduct(
    httpClient: makeHttpAdapter(), url: makeApiUrl('products'));
