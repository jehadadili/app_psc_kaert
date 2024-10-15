import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/style/color/color_app.dart';

class CustomContainerTop extends StatelessWidget {
  const CustomContainerTop({super.key, this.child});
  final Widget? child;
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
        child: child);
  }
}
