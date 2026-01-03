import 'package:almuhafiz_teachers/core/constants/app_strings.dart';

enum Riwayah {
  hafsAnAsim,
  warshAnNafi,
  qalunAnNafi,
  adDuriAnAbiAmr,
}

extension RiwayahExt on Riwayah {

  String get key => toString().split('.').last;

  String get label {
    switch (this) {
      case Riwayah.hafsAnAsim:
        return AppStrings.instance.hafsAnAsim;
      case Riwayah.warshAnNafi:
        return AppStrings.instance.warshAnNafi;
      case Riwayah.qalunAnNafi:
        return AppStrings.instance.qalunAnNafi;
      case Riwayah.adDuriAnAbiAmr:
        return AppStrings.instance.adDuriAnAbiAmr;
    }
  }

  String get description {
    switch (this) {
      case Riwayah.hafsAnAsim:
        return "";
      case Riwayah.warshAnNafi:
        return "";
      case Riwayah.qalunAnNafi:
        return "";
      case Riwayah.adDuriAnAbiAmr:
        return "";
    }
  }

  static Riwayah fromString(String value) {
    return Riwayah.values.firstWhere(
          (e) => e.key == value,
      orElse: () => Riwayah.hafsAnAsim,
    );
  }
}
