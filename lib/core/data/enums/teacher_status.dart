import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:flutter/animation.dart';

enum TeacherStatus { onlineNow, inSession, notAvailable, notFound }

extension TeacherStatusExt on TeacherStatus {

  String get key => toString().split('.').last;


  String get label {
    switch (this) {
      case TeacherStatus.onlineNow:
        return AppStrings.instance.onlineNow;
      case TeacherStatus.inSession:
        return AppStrings.instance.inSession;
      case TeacherStatus.notAvailable:
        return AppStrings.instance.notAvailable;
      case TeacherStatus.notFound:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  Color get color {
    switch (this) {
      case TeacherStatus.onlineNow:
        return AppColors.secondaryClr;
      case TeacherStatus.inSession:
        return AppColors.redClr;
      case TeacherStatus.notAvailable:
        return AppColors.silverClr;
      case TeacherStatus.notFound:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  static TeacherStatus fromString(String value) {
    return TeacherStatus.values.firstWhere(
          (e) => e.key == value,
      orElse: () => TeacherStatus.notFound,
    );
  }
}

