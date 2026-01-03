import 'package:almuhafiz_teachers/core/navigation/app_routes.dart';
import 'package:almuhafiz_teachers/features/auth/pages/completeProfile/presentation/controllers/complete_profile_bindings.dart';
import 'package:almuhafiz_teachers/features/auth/pages/completeProfile/presentation/ui/pages/complete_profile_page.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/presentation/controllers/login_bindings.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/presentation/ui/pages/login_page.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/presentation/controllers/register_bindings.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/presentation/ui/pages/register_page.dart';
import 'package:almuhafiz_teachers/features/bottom_nav/presentation/controllers/bottom_nav_bindings.dart';
import 'package:almuhafiz_teachers/features/bottom_nav/presentation/pages/bottom_nav_page.dart';
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

    GetPage(
      name: AppRoutes.bottomNav,
      page: () => const BottomNavPage(),
      bindings: [
        BottomNavBindings()
      ],
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 800),
    ),

    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBindings(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 800),
    ),

    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: RegisterBindings(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 800),
    ),

    GetPage(
      name: AppRoutes.completeProfile,
      page: () => const CompleteProfilePage(),
      binding: CompleteProfileBindings(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 800),
    ),

  ];
}
