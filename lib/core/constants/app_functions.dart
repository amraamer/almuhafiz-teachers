import 'dart:io';
import 'package:almuhafiz_teachers/core/common/common_snacbar.dart';
import 'package:almuhafiz_teachers/core/constants/app_links.dart';
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class AppFunctions {
  AppFunctions._();

  static String getMaritalStatusString(int maritalStatus, int gender) {
    if (gender == 0) {
      switch (maritalStatus) {
        case 0:
          return 'maritalStatusSingleMale'.tr;
        case 1:
          return 'maritalStatusMarriedMale'.tr;
        case 2:
          return 'maritalStatusDivorcedMale'.tr;
        case 3:
          return 'maritalStatusWidowedMale'.tr;
        default:
          return 'maritalStatusSingleMale'.tr;
      }
    } else {
      switch (maritalStatus) {
        case 0:
          return 'maritalStatusSingleFemale'.tr;
        case 1:
          return 'maritalStatusMarriedFemale'.tr;
        case 2:
          return 'maritalStatusDivorcedFemale'.tr;
        case 3:
          return 'maritalStatusWidowedFemale'.tr;
        default:
          return 'maritalStatusSingleFemale'.tr;
      }
    }
  }

 static List<String> getWorkingDays(List<DateTime> workingTimes) {
    final dayNames = [
      'monday'.tr,
      'tuesday'.tr,
      'wednesday'.tr,
      'thursday'.tr,
      'friday'.tr,
      'saturday'.tr,
      'sunday'.tr
    ];
    return workingTimes.map((date) {
      final index = date.weekday - 1;
      return dayNames[index];
    }).toList();
  }

  static String formatTime(DateTime time) {
    final hour24 = time.hour;
    final minute = time.minute.toString().padLeft(2, '0');

    final isAm = hour24 < 12;
    final hour12 = hour24 % 12 == 0 ? 12 : hour24 % 12;

    return "$hour12:$minute ${isAm ? 'am'.tr : 'pm'.tr}";
  }

  static String getGenderString(int gender) {
    if (gender == 0) {
      return 'genderMale'.tr;
    } else {
      return 'genderFemale'.tr;
    }
  }

  static String convertMinutesToTime(int minutes) {
    int hours = minutes ~/ 60;
    int remainingMinutes = minutes % 60;

    String hoursText = '';
    String minutesText = '';

    if (hours > 0) {
      if (hours == 1) {
        hoursText = 'convertedTimeHour'.tr;
      } else if (hours >= 2 && hours <= 10) {
        hoursText = '$hours ${'convertedTimeHours'.tr}';
      } else {
        hoursText = '$hours ${'convertedTimeHour'.tr}';
      }
    }

    if (remainingMinutes == 1) {
      minutesText = 'convertedTimeMinute'.tr;
    } else if (remainingMinutes > 1) {
      if (remainingMinutes > 2 && remainingMinutes <= 10) {
        minutesText = '$remainingMinutes ${'convertedTimeMinutes'.tr}';
      } else {
        minutesText = '$remainingMinutes ${'convertedTimeMinute'.tr}';
      }
    }

    if (hours > 0 && remainingMinutes > 0) {
      return '$hoursText ${'convertedTimeAnd'.tr} $minutesText';
    } else if (hours > 0) {
      return hoursText;
    } else {
      return minutesText;
    }
  }

  static String formatIsoToRelativeArabic(String iso) {
    final now = DateTime.now();
    final dt = DateTime.parse(iso).toLocal();
    final diff = now.difference(dt);

    if (diff.inSeconds < 5) return AppStrings.instance.now;
    if (diff.inSeconds < 60) {
      return '${AppStrings.instance.ago} ${diff.inSeconds} ${AppStrings.instance
          .seconds}';
    }
    if (diff.inMinutes < 60) {
      return '${AppStrings.instance.ago} ${diff.inMinutes} ${AppStrings.instance
          .minute}';
    }
    if (diff.inHours < 24) {
      return '${AppStrings.instance.ago} ${diff.inHours} ${AppStrings.instance
          .hour}';
    }
    if (diff.inDays < 7) {
      return '${AppStrings.instance.ago} ${diff.inDays} ${AppStrings.instance
          .day}';
    }
    final weeks = (diff.inDays / 7).floor();
    if (weeks < 5) {
      return '${AppStrings.instance.ago} $weeks ${AppStrings.instance.week}';
    }
    final months = (diff.inDays / 30).floor();
    if (months < 12) {
      return '${AppStrings.instance.ago} $months ${AppStrings.instance.month}';
    }
    final years = (diff.inDays / 365).floor();
    return '${AppStrings.instance.ago} $years ${AppStrings.instance.years}';
  }

  static void redirectToStores() async {
    if (Platform.isAndroid) {
      final Uri url = Uri.parse(
          'https://play.google.com/store/apps/details?id=com.bushraa.user');
      if (!await launchUrl(url)) {
        // AppDialogs.showErrorDialog("unexpectedErrorTryAgain".tr);
      }
    }
  }

  static String getCountryName(String countryCode) {
    switch (countryCode.toLowerCase()) {
      case 'sa':
        return 'saudiArabia'.tr;
      case 'ae':
        return 'unitedArabEmirates'.tr;
      case 'eg':
        return 'egypt'.tr;
      case 'kw':
        return 'kuwait'.tr;
      case 'qa':
        return 'qatar'.tr;
      case 'bh':
        return 'bahrain'.tr;
      case 'om':
        return 'oman'.tr;
      case 'jo':
        return 'jordan'.tr;
      case 'lb':
        return 'lebanon'.tr;
      case 'sy':
        return 'syria'.tr;
      case 'iq':
        return 'iraq'.tr;
      case 'ma':
        return 'morocco'.tr;
      case 'dz':
        return 'algeria'.tr;
      case 'tn':
        return 'tunisia'.tr;
      case 'ly':
        return 'libya'.tr;
      case 'sd':
        return 'sudan'.tr;
      case 'ye':
        return 'yemen'.tr;
      case 'ps':
        return 'palestine'.tr;
      case 'usa':
        return 'unitedStates'.tr;
      case 'uk':
        return 'unitedKingdom'.tr;
      case 'ca':
        return 'canada'.tr;
      case 'fr':
        return 'france'.tr;
      case 'de':
        return 'germany'.tr;
      case 'it':
        return 'italy'.tr;
      case 'es':
        return 'spain'.tr;
      case 'tr':
        return 'turkey'.tr;
      case 'in':
        return 'india'.tr;
      case 'cn':
        return 'china'.tr;
      case 'jp':
        return 'japan'.tr;
      case 'kr':
        return 'southKorea'.tr;
      case 'br':
        return 'brazil'.tr;
      case 'ru':
        return 'russia'.tr;
      case 'au':
        return 'australia'.tr;

    // ------- Default -------
      default:
        return 'unitedArabEmirates'.tr;
    }
  }

  static List<Map<String, String>> getWeekDays({DateTime? startDate}) {
    final now = startDate ?? DateTime.now();

    return List.generate(7, (index) {
      final day = now.add(Duration(days: index));

      return {
        "dayName": DateFormat.E('ar').format(day), // اسم اليوم بالعربية
        "date": DateFormat('dd').format(day),      // رقم اليوم
      };
    });
  }

 static String formatSlotsDateRange(List<DateTime> workingDate) {
    if (workingDate.isEmpty) return '';

    // final sortedSlots = [...slots]
    //   ..sort((a, b) => a.date.compareTo(b.date));

    final startDate = workingDate.first;
    final endDate = workingDate.last;

    final startFormatted = formatFullDate(startDate);
    final endFormatted = formatFullDate(endDate);

    return "${'from'.tr} $startFormatted ${'to'.tr} $endFormatted";
  }

 static String formatFullDate(DateTime date) {
    final locale = Get.locale?.languageCode ?? 'ar';

    final dayName = DateFormat('EEEE', locale).format(date);
    final dayNumber = DateFormat('dd', locale).format(date);
    final monthName = DateFormat('MMMM', locale).format(date);
    final year = DateFormat('yyyy', locale).format(date);

    return "$dayName $dayNumber $monthName $year";
  }

  static void redirectToStoresUserApp() async {
    if (Platform.isAndroid) {
      final Uri url = Uri.parse(
          AppConstantLinks.appStoreLink);
      if (!await launchUrl(url)) {
        CommonSnackBar.error('unexpectedError'.tr);
      }
    } else if (Platform.isIOS) {
      final Uri url =
      Uri.parse(AppConstantLinks.appStoreLink);
      if (!await launchUrl(url)) {
        CommonSnackBar.error('unexpectedError'.tr);
      }
    }
  }

}

extension CountryFlagExt on String {
  String toFlagEmoji() {
    if (length != 2) return this;
    final upper = toUpperCase();
    const base = 0x1F1E6;
    final first = base + upper.codeUnitAt(0) - 65;
    final second = base + upper.codeUnitAt(1) - 65;
    return String.fromCharCode(first) + String.fromCharCode(second);
  }
}

