import 'package:projeto/application/usecases/remote_authentication.dart';
import 'package:projeto/domain/usecases/authentication.dart';
import 'package:projeto/main/factories/http/api_url_factory.dart';
import 'package:projeto/main/factories/http/http_client_factory.dart';

Authentication makeRemoteAuthentication() => RemoteAuthentication(
    httpClient: makeHttpAdapter(), url: makeApiUrl('auth/signin'));
