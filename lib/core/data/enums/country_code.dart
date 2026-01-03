import 'package:almuhafiz_teachers/core/constants/app_strings.dart';


enum CountryCode { eg, sa, ae, qa, kw, jo, ma, us, gb, fr, de, tr }


extension CountryCodeExt on CountryCode {

  String get key => name;

  String get label {
    switch (this) {
      case CountryCode.eg:
        return AppStrings.instance.egypt;
      case CountryCode.sa:
        return AppStrings.instance.saudiArabia;
      case CountryCode.ae:
        return AppStrings.instance.unitedArabEmirates;
      case CountryCode.qa:
        return AppStrings.instance.qatar;
      case CountryCode.kw:
        return AppStrings.instance.kuwait;
      case CountryCode.jo:
        return AppStrings.instance.jordan;
      case CountryCode.us:
        return AppStrings.instance.unitedStates;
      case CountryCode.gb:
        return AppStrings.instance.unitedKingdom;
      case CountryCode.fr:
        return AppStrings.instance.france;
      case CountryCode.de:
        return AppStrings.instance.germany;
      case CountryCode.tr:
        return AppStrings.instance.turkey;
      // case CountryCode.IN:
      //   return AppStrings.instance.india;
      case CountryCode.ma:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  String get dialCode {
    switch (this) {
      case CountryCode.eg:
        return '+20';
      case CountryCode.sa:
        return '+966';
      case CountryCode.ae:
        return '+971';
      case CountryCode.qa:
        return '+974';
      case CountryCode.kw:
        return '+965';
      case CountryCode.jo:
        return '+962';
      case CountryCode.ma:
        return '+212';

      case CountryCode.us:
        return '+1';
      case CountryCode.gb:
        return '+44';
      case CountryCode.fr:
        return '+33';
      case CountryCode.de:
        return '+49';
      case CountryCode.tr:
        return '+90';
      // case CountryCode.IN:
      //   return '+91';
    }
  }

  static CountryCode fromString(String value) {
    return CountryCode.values.firstWhere(
          (e) => e.name == value,
      orElse: () => CountryCode.eg,
    );
  }
}

