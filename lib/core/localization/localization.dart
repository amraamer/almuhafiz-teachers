import 'package:almuhafiz_teachers/core/constants/app_keys.dart';
import 'package:almuhafiz_teachers/core/localization/ar.dart';
import 'package:almuhafiz_teachers/core/localization/en.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class LocalizationService extends Translations {
  Locale? appLocale = arabicLocale;

  final cacheStorage = GetStorage();

  set locale(Locale? value) => appLocale = value;

  static const fallbackLocale = Locale('ar', 'EG');

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUs,
    'ar_EG': arEg,
  };

  static const arabicOption = 'عربي';
  static const englishOption = 'English';

  static const arabicLocale = Locale('ar', 'EG');
  static const englishLocale = Locale('en', 'US');

  Future<void> changeLocale(Locale locale) async {
    appLocale = locale;
    await saveLocale(locale);
    Get.updateLocale(locale);
  }

  Future<void> saveLocale(Locale locale) async {
    await cacheStorage.write(
      AppKeys.appLocale,
      locale.languageCode,
    );
  }

  Locale getLocale() {
    final localeLanguage = cacheStorage.read(AppKeys.appLocale);
    if (localeLanguage == englishLocale.languageCode) {
      appLocale = englishLocale;
    } else {
      appLocale = arabicLocale;
    }

    return appLocale!;
  }
}
