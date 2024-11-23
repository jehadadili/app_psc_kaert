import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/image/image_app.dart';
import 'package:market/src/core/widget/custom_animation_text.dart';

import '../../../../../../../core/style/color/color_app.dart';

class CustomContainerTop extends StatelessWidget {
  const CustomContainerTop({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 180.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              ColorApp.bluedark,
              BlendMode.difference,
            ),
            image: AssetImage(
              'assets/image/Group.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child:  Padding(
                      padding: EdgeInsets.all(25.w),
                      child: Row(
                        children: [
                          const CustomAnimationText(
                            text: 'Register',
                            color: ColorApp.white,
                            fontSize: 30,
                          ),
                          Image.asset(
                            ImageApp.logo,
                            width: 150.w,
                            height: 100.h,
                          ),
                        ],
                      ),
                    ),);
  }
}
