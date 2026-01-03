import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/mini_models/drop_down_item_model.dart';

class ValidatorHandler {
  static String? Function(String?)? emailValidator = (String? txt) {
    if (txt!.isEmpty) {
      return AppStrings.instance.requiredField;
    }
    if (!txt.contains("@") || !txt.contains(".")) {
      return AppStrings.instance.invalidEmail;
    } else if (txt.trim().contains(" ")) {
      return AppStrings.instance.noSpacesInEmail;
    } else {
      return null;
    }
  };

  static String? Function(String?)? otpValidator = (String? txt) {
    if (txt == null || txt.isEmpty) {
      return AppStrings.instance.requiredField;
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(txt)) {
      return AppStrings.instance.onlyNumbersAllowed;
    }
    if (txt.length < 6) {
      return AppStrings.instance.enterLongerText;
    }
    return null;
  };



  static String? Function(String?)? strongPasswordValidator = (String? txt) {
    if (txt == null || txt.isEmpty) {
      return AppStrings.instance.requiredField;
    }
    if (txt.length < 8) {
      return AppStrings.instance.enterLongerText;
    }
    if (!RegExp(r'[A-Za-z]').hasMatch(txt)) {
      return AppStrings.instance.passwordMustHaveLetter;
    }
    // if (!RegExp(r'[!@#\$&*~.,;:<>?/^%]').hasMatch(txt)) {
    //   return AppStrings.instance.passwordMustHaveSymbol;
    // }

    return null;
  };

  static String? Function(String?) confirmedPassword(String mainPassword) {
    return (String? txt) {
      if (txt == null || txt.isEmpty) {
        return AppStrings.instance.requiredField;
      }

      if (txt != mainPassword) {
        return AppStrings.instance.passwordsNotMatch;
      }

      return null;
    };
  }

  static String? Function(String?) phoneValidator = (String? txt) {
    if (txt!.isEmpty) {
      return AppStrings.instance.requiredField;
    } else if (txt.length > 11) {
      return AppStrings.instance.invalidPhone;
    } else {
      return null;
    }
  };

  static String? Function(String?)? requiredAndLengthThreeValidator = (String? txt) {
    if (txt!.isEmpty) {
      return AppStrings.instance.requiredField;
    } else if (txt.length < 3) {
      return AppStrings.instance.enterLongerText;
    } else {
      return null;
    }
  };

  static String? Function(DropDownItemModel<dynamic>?)? dropDownValidator = (DropDownItemModel<dynamic>? dropDownItem) {
    if (dropDownItem?.value == null) {
      return AppStrings.instance.requiredField;
    } else {
      return null;
    }
  };

  static String? Function(String?)? requiredAndLengthEightValidator = (String? txt) {
    if (txt!.isEmpty) {
      return AppStrings.instance.requiredField;
    } else if (txt.length < 8) {
      return AppStrings.instance.enterLongerText;
    } else {
      return null;
    }
  };

  static String? Function(String?)? requiredAndLengthSixValidator = (String? txt) {
    if (txt!.isEmpty) {
      return AppStrings.instance.requiredField;
    } else if (txt.length < 6) {
      return AppStrings.instance.enterLongerText;
    } else {
      return null;
    }
  };

  static String? Function(String?)? ageValidator = (String? txt) {
    if (txt == null || txt.isEmpty) {
      return AppStrings.instance.enterAge;
    }

    final age = int.tryParse(txt);
    if (age == null) {
      return AppStrings.instance.enterValidNumber;
    }

    if (age < 12 || age > 99) {
      return AppStrings.instance.ageRange;
    }

    return null;
  };

  static String? Function(String?, String)? confirmationPassword = (String? txt, String mainPassword) {
    if (txt!.isEmpty) {
      return AppStrings.instance.requiredField;
    } else if (mainPassword != txt) {
      return AppStrings.instance.passwordsNotMatch;
    } else if (txt.length < 6) {
      return AppStrings.instance.enterLongerText;
    } else {
      return null;
    }
  };

  static String? Function(String?)? requiredValidator = (String? txt) {
    if (txt!.isEmpty) {
      return AppStrings.instance.requiredField;
    } else {
      return null;
    }
  };

  static String? Function(String?)? requiredMin6Max140Validator = (String? txt) {
    if (txt!.isEmpty) {
      return AppStrings.instance.requiredField;
    } else if (txt.length < 6) {
      return AppStrings.instance.enterLongerText;
    } else if (txt.length > 140) {
      return AppStrings.instance.textTooLong140;
    } else {
      return null;
    }
  };

  static String? Function(String?)? requiredMin6Max90Validator = (String? txt) {
    if (txt!.isEmpty) {
      return AppStrings.instance.requiredField;
    } else if (txt.length < 6) {
      return AppStrings.instance.enterLongerText;
    } else if (txt.length > 90) {
      return AppStrings.instance.textTooLong90;
    } else {
      return null;
    }
  };

  static String? Function(String?)? requiredMin3Max60Validator = (String? txt) {
    if (txt!.isEmpty) {
      return AppStrings.instance.requiredField;
    } else if (txt.length < 3) {
      return AppStrings.instance.enterLongerText;
    } else if (txt.length > 60) {
      return AppStrings.instance.textTooLong60;
    } else {
      return null;
    }
  };
}
