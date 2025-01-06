import 'package:easy_localization/easy_localization.dart';

class Validators {
  static const String email =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'auth.required.password'.tr();
    } else if (value.length < 8) {
      return 'auth.invalid.password_length'.tr();
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'auth.required.email'.tr();
    } else if (!RegExp(email).hasMatch(value)) {
      return 'auth.invalid.email_valid'.tr();
    }
    return null;
  }

  static String? validateName(String? value,
      {String? requiredMessage, int invalidAfter = 3, String? invalidMessage}) {
    if (value == null || value.isEmpty) {
      return requiredMessage ?? 'auth.required.name'.tr();
    } else if (value.length < invalidAfter) {
      return invalidMessage ?? 'auth.invalid.name_length'.tr();
    }
    return null;
  }

  static String? validatePhone(String? value, bool isvalid) {
    if (value == null || value.isEmpty) {
      return 'auth.required.phone'.tr();
    } else if (!isvalid) {
      return 'auth.invalid.phone_length'.tr();
    }
    return null;
  }
}
