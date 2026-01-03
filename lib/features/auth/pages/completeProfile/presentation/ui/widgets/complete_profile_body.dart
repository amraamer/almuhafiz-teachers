import 'dart:ui';
import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/data/enums/riwayah.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:almuhafiz_teachers/core/utils/validator_handler.dart';
import 'package:almuhafiz_teachers/core/widgets/bottom_sheets/multi_select_bottom_sheet.dart';
import 'package:almuhafiz_teachers/core/widgets/bottom_sheets/social_links_bottom_sheet.dart';
import 'package:almuhafiz_teachers/core/widgets/buttons/primary_button.dart';
import 'package:almuhafiz_teachers/features/auth/pages/completeProfile/presentation/controllers/complete_profile_controller.dart';
import 'package:almuhafiz_teachers/features/auth/pages/completeProfile/presentation/ui/widgets/gender_cards_widget.dart';
import 'package:almuhafiz_teachers/features/auth/presentation/widgets/text_field_with_title.dart';
import 'package:almuhafiz_teachers/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CompleteProfileBody extends GetView<CompleteProfileController> {

  const CompleteProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.pngs.authImage.path),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: AppColors.backgroundBlur,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        // physics: BouncingScrollPhysics(),
                        child: Column(
                          spacing: 22.h,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            hSpace(5),
                            Text(
                              AppStrings.instance.completeYourData,
                              style: AppTextStyles.style32W600BlackDeco,
                            ),

                            // MultiExpandableDropdown(
                            //   hint: AppStrings.instance.riwayahType,
                            //   label: AppStrings.instance.riwayat,
                            //   items: controller.riwayat,
                            //   maxListHeight: 200,
                            //   bkgColor: AppColors.glassWhiteClr,
                            //   onChanged: (values) {
                            //     controller.selectedRiwayatList.value = values;
                            //   },
                            // ),

                            TextFieldWithTitle(
                                fillColor: AppColors.glassWhiteClr,
                                controller: controller.ageCtrl,
                                title: AppStrings.instance.yourAge,
                                hintTxt: AppStrings.instance.enterAgeHere,
                                textInputType: TextInputType.number,
                                validator: ValidatorHandler.ageValidator
                            ),

                            TextFieldWithTitle(
                                fillColor: AppColors.glassWhiteClr,
                                controller: controller.bioCtrl,
                                title: AppStrings.instance.bio,
                                hintTxt: AppStrings.instance.bioHint,
                                maxLines: 3,
                                textInputType: TextInputType.text,
                                validator: ValidatorHandler.ageValidator
                            ),

                            GenderCardsWidget(),


                            TextFieldWithTitle(
                                fillColor: AppColors.glassWhiteClr,
                                controller: controller.jobCtrl,
                                title: AppStrings.instance.job,
                                hintTxt: AppStrings.instance.enterYourJob,
                                textInputType: TextInputType.text,
                                validator: ValidatorHandler.requiredValidator
                            ),


                            MultiSelectBottomSheet<Riwayah>(
                              hint: AppStrings.instance.selectRiwayat,
                              label: AppStrings.instance.riwayat,
                              items: Riwayah.values,
                              selectedItems: controller.riwayat,
                              itemLabel: (e) => e.label,
                              onSelectionChanged: (list) {
                                controller.riwayat.assignAll(list);
                              },
                            ),

                            //
                            // SocialLinksBottomSheet(
                            //   label: AppStrings.instance.socialLinks,
                            //   hint: AppStrings.instance.addSocialLink,
                            //   initialValues: controller.socialLinks,
                            //   onChanged: (values) {
                            //     controller.socialLinks.value = values;
                            //   },
                            // ),

                            SocialLinksBottomSheet(
                              label: AppStrings.instance.worksInAnotherAppsHint,
                              hint: AppStrings.instance.worksInAnotherAppsHint,
                              initialValues: controller.worksInAnotherApps,
                              onChanged: (values) {
                                controller.worksInAnotherApps.value = values;
                              },
                            ),


                            // GestureDetector(
                            //   onTap: () => controller.pickImageFromGallery(),
                            //   child: Obx(() {
                            //     final localImage = controller.selectedImage.value;
                            //     final networkImage = controller.currentUser.imageProfile;
                            //
                            //     ImageProvider? imageProvider;
                            //
                            //     if (localImage != null) {
                            //       imageProvider = FileImage(localImage);
                            //     } else if (networkImage != null && networkImage.isNotEmpty) {
                            //       imageProvider = NetworkImage(networkImage);
                            //     } else {
                            //       imageProvider = null;
                            //     }
                            //
                            //     return CircleAvatar(
                            //       radius: 55,
                            //       backgroundImage: imageProvider,
                            //       child: imageProvider == null
                            //           ? const Icon(Icons.camera_alt, size: 28)
                            //           : null,
                            //     );
                            //   }),
                            // ),


                          ],
                        ),
                      ),
                    ),

                    hSpace(20),

                    PrimaryButton(
                      txt: AppStrings.instance.continueTxt,
                      bkColor: AppColors.offWhite,
                      txtColor: AppColors.blackClr,
                      loadingColor: AppColors.offWhite,
                      fontSize: 20.sp,
                      height: 50.h,
                      fontWeight: FontWeight.w800,
                      onPressed: () async {
                        await controller.completeProfile();
                      },
                    ),
                    hSpace(20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
