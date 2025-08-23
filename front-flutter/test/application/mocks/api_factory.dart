import 'package:faker/faker.dart';

class ApiFactory {
  static Map makeAccountJson() => {'token': faker.guid.guid()};

  static Map makeInvalidJson() => {'invalid_key': 'invalid_value'};

  static List<Map> makeInvalidList() => [makeInvalidJson(), makeInvalidJson()];
}
