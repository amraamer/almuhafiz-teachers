// import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
// import 'package:almuhafiz_teachers/core/constants/app_dimens.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// class FavoriteIconWidget extends GetView<FavoriteService> {
//   final String teacherId;
//   final double? height;
//   final double? width;
//   final double? iconSize;
//
//   const FavoriteIconWidget({super.key, required this.teacherId, this.height, this.width, this.iconSize});
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => GestureDetector(
//       onTap: () {
//         if(controller.authService.authType.value == AuthType.guest){
//           // AppDialogs.showLoginFirstDialog(context,);
//           return;
//         }
//         controller.toggleFavorite(teacherId);
//       },
//       child: Container(
//         height: height ?? 32.h,
//         width: width ?? 32.w,
//         padding: EdgeInsets.all(3.r),
//         decoration: BoxDecoration(
//           color: AppColors.black04,
//           borderRadius: BorderRadius.circular(AppDimens.r8),
//         ),
//         child: Icon(
//           controller.favoriteList.contains(teacherId) ? Icons.favorite : Icons.favorite_border,
//           color: AppColors.primaryIconClr,
//           size: iconSize ?? 20.sp,
//         ),
//       ),
//     ));
//   }
// }
