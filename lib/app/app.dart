import 'package:almuhafiz_teachers/core/bindings/init_bindings.dart';
import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/localization/localization.dart';
import 'package:almuhafiz_teachers/core/localization/localization_service.dart';
import 'package:almuhafiz_teachers/core/navigation/app_pages.dart';
import 'package:almuhafiz_teachers/core/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final localizationController = Get.find<LocalizationServiceController>();
    final localizationService = Get.find<LocalizationService>();

    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: KeyboardDismisser(
        child: GetMaterialApp(
          title: "المُحَفِّظين",
          debugShowCheckedModeBanner: false,
          getPages: AppPages.getAll,
          initialRoute: AppRoutes.register,
          initialBinding: AppInitBindings(),
          locale: localizationController.localizationString.value == 'ar'
              ? LocalizationService.arabicLocale
              : LocalizationService.englishLocale,
          fallbackLocale: LocalizationService.fallbackLocale,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            FlutterQuillLocalizations.delegate,
          ],
          translations: localizationService,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.offWhite,
            textTheme: GoogleFonts.tajawalTextTheme(),
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.whiteClr,
              elevation: 0,
            ),
          ),
          builder: (context, widget) {
            final mediaQuery = MediaQuery.of(context);
            final scale = mediaQuery.textScaler.scale(1).clamp(1, 1.2).toDouble();
            return MediaQuery(data: mediaQuery.copyWith(
                textScaler: TextScaler.linear(scale)
            ), child: widget!);
          },
        ),
      ),
    );
  }
}
