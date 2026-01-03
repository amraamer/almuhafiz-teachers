import 'package:almuhafiz_teachers/core/navigation/app_routes.dart';
import 'package:almuhafiz_teachers/core/services/Auth/auth_service.dart';
import 'package:almuhafiz_teachers/core/services/updates/update_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final AuthService _authService;

  SplashController(this._authService);

  final int _minimumDelay = 1800; // in Milliseconds

  Future<void> initApp() async {
    try {
      // trigger checkAuth and wait minimum delay 2 seconds
      await Future.wait([
        Future.delayed(Duration(milliseconds: _minimumDelay)),
        _authService.checkAuth(),
      ]);
    } catch (e) {
      debugPrint("error in initApp in check Auth ${e.toString()}");
      Get.offAllNamed(AppRoutes.mustUpdate);
    }

    bool continueToApp = true;
    try {
      continueToApp = await UpdateService().checkForUpdate();
    } catch (e) {
      debugPrint("error in initApp in UpdateService ${e.toString()}");
    }

    // start navigate user to app
    if (continueToApp) {
      _authService.navigateUser();
    } else {
      Get.offAllNamed(AppRoutes.mustUpdate);
    }
  }

  @override
  void onInit() {
    super.onInit();
    initApp();
  }
}