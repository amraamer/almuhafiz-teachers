// import 'package:almuhafiz/core/constants/app_colors.dart';
// import 'package:almuhafiz/core/constants/app_strings.dart';
// import 'package:almuhafiz/core/constants/app_text_styles.dart';
// import 'package:almuhafiz/core/services/connection/connection_services.dart';
// import 'package:almuhafiz/core/utils/spacer.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class NoInternetBanner extends StatelessWidget {
//   const NoInternetBanner({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<ConnectionController>();
//
//     return Obx(() {
//       if (controller.isConnected.value) {
//         return const SizedBox.shrink();
//       }
//
//       return Positioned(
//         top: 0,
//         left: 0,
//         right: 0,
//         child: Material(
//           color: AppColors.offWhite,
//           child: SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.all(12),
//               child: Column(
//                 children: [
//                   Icon(Icons.wifi_off, color: Colors.white),
//                   SizedBox(width: 8),
//                   Text(
//                     AppStrings.instance.noInternetConnection,
//                     style: AppTextStyles.style16W700Primary,
//                   ),
//                   hSpace(12),
//                   Text(
//                     AppStrings.instance.noInternetConnectionMessage,
//                     style: AppTextStyles.style14W600Primary,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
