import 'package:equatable/equatable.dart';
import 'package:projeto/pages/validators/protocols/field_validation.dart';
import 'package:projeto/pages/validators/protocols/validation.dart';

class RequiredFieldValidation extends Equatable implements FieldValidation {
  final String field;

  List get props => [field];

  RequiredFieldValidation(this.field);

  ValidationError? validate(Map input) =>
      input[field]?.isNotEmpty == true ? null : ValidationError.requiredField;
}
