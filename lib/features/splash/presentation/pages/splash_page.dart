import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightBeigeClr,
        body: Container(
          alignment: Alignment.center,
          color: AppColors.backgroundClr,
          child: Center(
            child: VectorGraphic(loader: AssetBytesLoader(Assets.svgs.logoName)),
          ),
        )
    );
  }
}
