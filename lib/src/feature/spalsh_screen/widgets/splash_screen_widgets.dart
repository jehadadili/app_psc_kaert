import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/core/style/image/image_app.dart';
import 'package:market/src/core/widget/custom_widget_loading.dart';

class SplashScreenWidgets extends StatelessWidget {
  const SplashScreenWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorApp.blue,
              ColorApp.charcoalBlue,
              ColorApp.bluedark,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImageApp.logo,
                width: 200.w,
                height: 200.h,
              ),
              SizedBox(
                height: 50.h,
              ),
              const CustomWidgetLoading(
                color: ColorApp.white,
                size: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
