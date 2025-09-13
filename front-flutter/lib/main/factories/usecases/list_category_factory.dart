import 'package:projeto/application/usecases/remote_list_category.dart';
import 'package:projeto/domain/usecases/list_category.dart';
import 'package:projeto/main/factories/http/api_url_factory.dart';
import 'package:projeto/main/factories/http/http_client_factory.dart';

ListCategory makeRemoteListCategory() => RemoteListCategory(
    httpClient: makeHttpAdapter(), url: makeApiUrl('categories'));
