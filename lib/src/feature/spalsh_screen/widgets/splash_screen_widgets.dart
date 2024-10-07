import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/core/style/image/image_app.dart';

class SplashScreenWidgets extends StatelessWidget {
  const SplashScreenWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.charcoalBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageApp.logo),
            SizedBox(
              height: 50.h,
            ),
            LoadingAnimationWidget.threeRotatingDots(
              color: ColorApp.white,
              size: 100.sp,
            ),
          ],
        ),
      ),
    );
  }
}
