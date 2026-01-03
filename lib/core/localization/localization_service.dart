import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'localization.dart';

class LocalizationServiceController extends GetxController {
  final LocalizationService _localizationService;
  LocalizationServiceController(this._localizationService);

  final RxString localizationString = "".obs;

  Locale? get currentLocale => _localizationService.appLocale;

  String get currentLanguage => localizationString.value == "ar"
      ? LocalizationService.englishOption
      : LocalizationService.arabicOption;

  void switchLanguages() {
    if (localizationString.value == "ar") {
      localizationString("en");
      _localizationService.changeLocale(LocalizationService.englishLocale);
    } else {
      localizationString("ar");
      _localizationService.changeLocale(LocalizationService.arabicLocale);
    }
  }

  Future<void> selectLanguage(String languageCode) async {
    if (languageCode == "ar") {
      await _localizationService.changeLocale(LocalizationService.arabicLocale);
    } else if (languageCode == "en") {
      await _localizationService
          .changeLocale(LocalizationService.englishLocale);
    }
    localizationString(languageCode);
  }

  @override
  void onInit() {
    super.onInit();
    localizationString.value = _localizationService.appLocale!.languageCode;
  }
}

