import 'package:http/http.dart';
import 'package:projeto/infra/http/http_adapter.dart';
import 'package:projeto/infra/http/http_client.dart';

HttpClient makeHttpAdapter() => HttpAdapter(Client());
