import 'package:faker/faker.dart';
import 'package:projeto/domain/usecases/authentication.dart';

class ParamsFactory {
  static AuthenticationParams makeAuthentication() => AuthenticationParams(
      email: faker.internet.email(), secret: faker.internet.password());
}
