import 'package:projeto/pages/validators/protocols/field_validation.dart';
import 'package:projeto/pages/validators/protocols/validation.dart';

class ValidationComposite implements Validation {
  final List<FieldValidation> validations;

  ValidationComposite(this.validations);

  ValidationError? validate({required String field, required Map input}) {
    ValidationError? error;
    for (final validation in validations.where((v) => v.field == field)) {
      error = validation.validate(input);
      if (error != null) {
        return error;
      }
    }
    return error;
  }
}
