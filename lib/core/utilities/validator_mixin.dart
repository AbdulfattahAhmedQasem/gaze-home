import 'package:easy_localization/easy_localization.dart';
import 'package:gazhome/core/constants/app_strings.dart';

mixin ValidatorMixin {
  String? validateEmptyText(String? text) {
    if (text?.trim().isEmpty ?? true) {
      return AppStrings.requiredField.tr();
    }
    return null;
  }

  String? validatePhoneNumber(String? text) {
    if (text?.trim().isEmpty ?? true) {
      return AppStrings.requiredField.tr();
    } else if (text!.trim().length < 9) {
      return AppStrings.invalidPhoneNumber.tr();
    }
    return null;
  }

  String? validatePassword(String? text) {
    if (text?.trim().isEmpty ?? true) {
      return AppStrings.requiredField.tr();
    } else if (text!.trim().length < 8) {
      return AppStrings.shortPassword.tr();
    }
    return null;
  }

  String? validateConfirmPassword(String? password, String? otherPassword) {
    if (password?.trim() != otherPassword?.trim()) {
      return AppStrings.passwordNotMatched.tr();
    }
    return null;
  }

  // static String? validateOtp(String? otp) {
  //   if (otp!.length < 4) {
  //     return AppStrings.pleaseEnterTheVerificationCode;
  //   }
  //   return null;
  // }

  // String? validateDoubleNumber(String? text) {
  //   if ((text?.trim().isEmpty ?? true) || (text == '.')) {
  //     return AppStrings.requiredField;
  //   }
  //   return null;
  // }
}
