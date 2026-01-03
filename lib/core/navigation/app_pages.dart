import 'package:almuhafiz_teachers/core/navigation/app_routes.dart';
import 'package:almuhafiz_teachers/features/splash/presentation/controllers/splash_bindings.dart';
import 'package:almuhafiz_teachers/features/splash/presentation/pages/splash_page.dart';
import 'package:get/get.dart';


class AppPages {
  AppPages._();

  static List<GetPage> getAll = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBindings(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 800),
    ),

  ];
}
