// import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
// import 'package:almuhafiz_teachers/gen/assets.gen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:vector_graphics/vector_graphics.dart';
//
// class PageIndicator extends StatelessWidget {
//   final int current;
//   final int total;
//   const PageIndicator({super.key, required this.current, required this.total});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(total, (index) {
//         if (index == current) {
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 4.w),
//             child: VectorGraphic(
//               loader: AssetBytesLoader(Assets.svgs.scrolling),
//               width: 16.w,
//               height: 14.h,
//             ),
//           );
//         } else {
//           return Container(
//             width: 9.w,
//             height: 9.h,
//             margin: EdgeInsets.symmetric(horizontal: 4.w),
//             decoration: BoxDecoration(
//               color: AppColors.glassWhiteClr,
//               shape: BoxShape.circle,
//             ),
//           );
//         }
//       }),
//     );
//   }
// }
