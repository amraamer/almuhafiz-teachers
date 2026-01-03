// import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
// import 'package:almuhafiz_teachers/core/constants/app_dimens.dart';
// import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
// import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
// import 'package:almuhafiz_teachers/core/utils/spacer.dart';
// import 'package:almuhafiz_teachers/features/auth/pages/login/presentation/controllers/login_controller.dart';
// import 'package:almuhafiz_teachers/gen/assets.gen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:vector_graphics/vector_graphics.dart';
//
// class LoginAsGuest extends GetView<LoginController> {
//   const LoginAsGuest({super.key,});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () async => await controller.loginAsGuest(),
//       child: Container(
//         padding: EdgeInsets.all(AppDimens.r12),
//         decoration: BoxDecoration(
//           color: AppColors.glassWhiteClr,
//           borderRadius: BorderRadius.circular(16.r),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             VectorGraphic(
//                 loader: AssetBytesLoader(Assets.svgs.guest)),
//             hSpace(4),
//             Text(AppStrings.instance.loginAsGuest, style: AppTextStyles.style14W500Black,),
//           ],
//         ),
//       ),
//     );
//   }
// }
