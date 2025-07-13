import 'package:form_validator/form_validator.dart' as validator;

class FormValidator {
  var fullName =
      validator.ValidationBuilder()
          .required()
          .regExp(
            RegExp(r'^[A-Za-zÀ-ÿ]+(?: [A-Za-zÀ-ÿ]+)+$'),
            'Name and surname is required',
          )
          .build();

  var age =
      validator.ValidationBuilder()
          .required()
          .regExp(RegExp(r'^\d{1,3}$'), 'enter a valid age')
          .add((value) {
            final int age = int.parse(value!);
            if (age < 16) {
              return 'age must be greater than 16 or equal to 16';
            }
            return null;
          })
          .build();

  var phone =
      validator.ValidationBuilder()
          .required()
          .regExp(
            RegExp(r'^\(?[1-9]{2}\)? ?9?[0-9]{4}-?[0-9]{4}$'),
            'Enter a valid phone. (ddd) 91234-5678',
          )
          .build();

  var zipCode =
      validator.ValidationBuilder()
          .required()
          .regExp(RegExp(r'^\d{5}-?\d{3}$'), 'Enter a valid Cep')
          .build();

  var streetName = validator.ValidationBuilder().required().build();
  var streetNumber = validator.ValidationBuilder().required().build();
  var cityName = validator.ValidationBuilder().required().build();
}
