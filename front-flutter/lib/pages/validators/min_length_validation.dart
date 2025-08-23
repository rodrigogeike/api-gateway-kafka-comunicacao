import 'package:equatable/equatable.dart';
import 'package:projeto/pages/validators/protocols/field_validation.dart';
import 'package:projeto/pages/validators/protocols/validation.dart';

class MinLengthValidation extends Equatable implements FieldValidation {
  final String field;
  final int size;

  List get props => [field, size];

  MinLengthValidation({required this.field, required this.size});

  ValidationError? validate(Map input) =>
      input[field] != null && input[field].length >= size
          ? null
          : ValidationError.invalidField;
}
