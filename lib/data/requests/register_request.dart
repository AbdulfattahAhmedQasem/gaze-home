import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/utilities/typedefs.dart';

class RegisterRequest {
  RegisterRequest({
    required this.type,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.password,
    required this.passwordConfirmation,
    required this.taxNumber,
    required this.commercialRegister,
  });

  final UserType type;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String password;
  final String passwordConfirmation;
  final String taxNumber;
  final String commercialRegister;

  DataMap toMap() {
    return {
      'first_name': firstName.trim(),
      'last_name': lastName.trim(),
      'phone_number': '+966${phoneNumber.trim()}',
      'password': '+966$password',
      'password_confirmation': '+966$passwordConfirmation',
      'user_type': type.key,
      if (type.isBusiness()) ...{
        'company_vat': taxNumber.trim(),
        'cr_number': commercialRegister.trim(),
      },
    };
  }
}
