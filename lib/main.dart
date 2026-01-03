import 'package:almuhafiz_teachers/app/app.dart';
import 'package:almuhafiz_teachers/core/localization/localization.dart';
import 'package:almuhafiz_teachers/core/localization/localization_service.dart';
import 'package:almuhafiz_teachers/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final cacheStorage = GetStorage();

Future<void> initBeforeLaunch() async {
  await GetStorage.init();
  // await AppInfoHelper().init();
  Get.put(LocalizationService(), permanent: true);
  Get.put(LocalizationServiceController(Get.find()), permanent: true);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initBeforeLaunch();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}