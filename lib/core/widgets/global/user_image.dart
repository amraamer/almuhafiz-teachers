import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/widgets/buttons/glass_button.dart';
import 'package:almuhafiz_teachers/core/widgets/loading/custom_default_loading.dart';
import 'package:almuhafiz_teachers/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CircleImage extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final bool isUserMale;

  const CircleImage(
      {super.key, required this.imageUrl, this.radius = 25, required this.isUserMale});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showFullImage(context, imageUrl),
      child: Hero(
        tag: "${imageUrl}_${UniqueKey()}",
        child: CircleAvatar(
          radius: radius.r,
          backgroundColor: AppColors.cardClr,
          child: ClipOval(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (_, __) =>
                isUserMale ?
                Image.asset(Assets.pngs.maleProfile.path) :
                Image.asset(Assets.pngs.femaleProfile.path),
                errorWidget: (_, __, ___) =>
                isUserMale ?
                Image.asset(Assets.pngs.maleProfile.path) :
                Image.asset(Assets.pngs.femaleProfile.path),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


void _showFullImage(BuildContext context, String imageUrl) {
  showDialog(
    context: context,
    barrierColor: AppColors.whiteBlurClr,
    builder: (context) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: double.infinity,
            height: 400.h,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: AppColors.whiteBlurClr,
              borderRadius: BorderRadius.circular(20.r),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Hero(
                  tag: imageUrl,
                  child: InteractiveViewer(
                    minScale: 0.8,
                    maxScale: 5.0,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: CustomDefaultLoading(
                          color: AppColors.black04,
                          size: 25.sp,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error, color: AppColors.redClr),
                    ),
                  ),
                ),

                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 10,
                  child: GlassButton(
                    txt: AppStrings.instance.tapToClose,
                    onPressed: () async=> Get.back(),
                  ),
                ),

              ],
            ),
          ),
        ),
      );
    },
  );
}