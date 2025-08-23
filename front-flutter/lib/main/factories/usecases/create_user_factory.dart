import 'package:projeto/application/usecases/remote_create_user.dart';
import 'package:projeto/domain/usecases/create_user.dart';
import 'package:projeto/main/factories/http/api_url_factory.dart';
import 'package:projeto/main/factories/http/http_client_factory.dart';

CreateUser makeRemoteCreateUser() => RemoteCreateUser(
    httpClient: makeHttpAdapter(), url: makeApiUrl('auth/signup'));
