import 'package:projeto/application/usecases/remote_create_category.dart';
import 'package:projeto/domain/usecases/create_category.dart';
import 'package:projeto/main/factories/http/api_url_factory.dart';
import 'package:projeto/main/factories/http/http_client_factory.dart';

CreateCategory makeRemoteCreateCategory() => RemoteCreateCategory(
    httpClient: makeHttpAdapter(),
    url: makeApiUrl('service-category/categories'));
