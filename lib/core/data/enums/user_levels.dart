import 'package:get/get.dart';

enum UserLevel {
  beginner,      // الباحث عن النور
  committed,     // محبّ القرآن
  advanced,      // الذاكر الواعٍ
  expert,        // حافظ النور
  master,        // حامل القرآن
}


extension UserLevelExt on UserLevel {
  String get key => toString().split('.').last;

  String get title => 'student_level_${key}_title'.tr;

  String get description => 'student_level_${key}_description'.tr;

  static UserLevel fromString(String value) {
    return UserLevel.values.firstWhere(
          (e) => e.key == value,
      orElse: () => UserLevel.beginner,
    );
  }
}
