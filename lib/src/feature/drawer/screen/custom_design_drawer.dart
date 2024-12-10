import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/feature/drawer/widgets/custom_body_drawer.dart';
import 'package:market/src/feature/drawer/widgets/custom_user_drawer.dart';

class CustomDesignDrawer extends StatelessWidget {
  const CustomDesignDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50.h),
        const CustomUserDrawer(),
        SizedBox(height: 100.h),
        const Expanded(
          child: CustomBodyDrawer(),
        ),
      ],
    );
  }
}
