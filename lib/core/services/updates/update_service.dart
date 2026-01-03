import 'package:almuhafiz_teachers/core/cache/cache_storage_constants.dart';
import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_functions.dart';
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:almuhafiz_teachers/core/widgets/buttons/primary_button.dart';
import 'package:almuhafiz_teachers/gen/assets.gen.dart';
import 'package:almuhafiz_teachers/networking/firebase_constants.dart';
import 'package:almuhafiz_teachers/networking/firebase_keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:vector_graphics/vector_graphics.dart';

class UpdateService {
  late String currentVersionString;
  late int currentVersion;

  Future<void> fetchCurrentVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    currentVersionString = packageInfo.version;
    currentVersion = getExtendedVersionNumber(currentVersionString);
  }

  Future<bool> checkForUpdate() async {
    bool continueToApp = true;
    await fetchCurrentVersion();
    final doc = await FirebaseFirestore.instance
        .collection(FirebaseConstants.appDataCollection)
        .doc(FireKeys.versions)
        .get();
    final data = doc.data();
    if (data != null) {
      String blockedVersionString = data['blocked_user'];
      String fineVersionString = data['fine_user'];

      int blockedVersion = getExtendedVersionNumber(blockedVersionString);
      int fineVersion = getExtendedVersionNumber(fineVersionString);

      if (_isVersionLowerOrEqual(currentVersion, blockedVersion)) {
        continueToApp = false;
      } else if (_isVersionBetween(
          currentVersion, blockedVersion, fineVersion)) {
        _showMidUpdateDialog();
      } else {
        // No action needed
      }
    }
    return continueToApp;
  }

  bool _isVersionLowerOrEqual(int currentVersion, int blockedVersion) {
    return currentVersion <= blockedVersion;
  }

  bool _isVersionBetween(
      int currentVersion, int blockedVersion, int fineVersion) {
    return currentVersion > blockedVersion && currentVersion < fineVersion;
  }

  int getExtendedVersionNumber(String version) {
    List versionCells = version.split('.');
    versionCells = versionCells.map((i) => int.parse(i)).toList();
    return versionCells[0] * 100000 + versionCells[1] * 1000 + versionCells[2];
  }

  void _showMidUpdateDialog() async {
    final GetStorage storage = GetStorage();
    final lastShowMidUpdateDate = storage.read(CacheStorageConstants.lastShowMidUpdateDate);

    final currentTime = DateTime.now().millisecondsSinceEpoch;
    const fiveDaysInMilliseconds = 5 * 24 * 60 * 60 * 1000;

    // Check if the dialog was shown in the last 5 days
    if (lastShowMidUpdateDate != null &&
        (currentTime - lastShowMidUpdateDate) < fiveDaysInMilliseconds) {
      return;
    }

    await Future.delayed(const Duration(seconds: 3));

    Get.defaultDialog(
      title: '',
      backgroundColor: AppColors.whiteClr,
      titlePadding: EdgeInsets.zero,
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            VectorGraphic(
              loader: AssetBytesLoader(Assets.images.renewal.path),
              width: 200.w,
            ),
            hSpace(20),
            Text(
              AppStrings.instance.updateAvailable,
              style: AppTextStyles.style16W700Primary,
              textAlign: TextAlign.center,
            ),
            hSpace(36),
            PrimaryButton(
              txt: AppStrings.instance.updateNow,
              height: 50.h,
              onPressed: ()async{
                AppFunctions.redirectToStoresUserApp();
              },
            ),
          ],
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 5.h,
      ),
    );
    storage.write(CacheStorageConstants.lastShowMidUpdateDate, currentTime);
  }
}
