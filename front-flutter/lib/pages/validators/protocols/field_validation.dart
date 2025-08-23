import 'package:projeto/pages/validators/protocols/validation.dart';

abstract class FieldValidation {
  String get field;
  ValidationError? validate(Map input);
}
