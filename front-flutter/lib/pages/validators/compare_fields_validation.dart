import 'package:equatable/equatable.dart';
import 'package:projeto/pages/validators/protocols/field_validation.dart';
import 'package:projeto/pages/validators/protocols/validation.dart';

class CompareFieldsValidation extends Equatable implements FieldValidation {
  final String field;
  final String fieldToCompare;

  List get props => [field, fieldToCompare];

  CompareFieldsValidation({required this.field, required this.fieldToCompare});

  ValidationError? validate(Map input) => input[field] != null &&
          input[fieldToCompare] != null &&
          input[field] != input[fieldToCompare]
      ? ValidationError.invalidField
      : null;
}
