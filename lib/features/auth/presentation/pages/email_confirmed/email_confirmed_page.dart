import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/widgets/global/custom_rug_page.dart';
import 'package:almuhafiz_teachers/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class EmailConfirmedPage extends StatelessWidget {
  const EmailConfirmedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomRugPage(
        icon: Assets.pngs.success.path,
        title: AppStrings.instance.emailRegisteredSuccessfully,
        btnTitle: AppStrings.instance.completeYourInformation,
        onPressed: () async{
          // Get.offAllNamed(AppRoutes.completeProfile, arguments: Get.arguments);
        },
      ),
    );
  }
}
