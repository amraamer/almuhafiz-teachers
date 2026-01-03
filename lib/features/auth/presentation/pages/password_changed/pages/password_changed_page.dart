import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/navigation/app_routes.dart';
import 'package:almuhafiz_teachers/core/widgets/global/custom_rug_page.dart';
import 'package:almuhafiz_teachers/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordChangedPage extends StatelessWidget {
  const PasswordChangedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomRugPage(
        icon: Assets.pngs.lock.path,
        title: AppStrings.instance.passwordChanged,
        btnTitle: AppStrings.instance.loginNow,
        onPressed: () async{
          Get.offAllNamed(AppRoutes.login);
        },
      )
    );
  }
}
