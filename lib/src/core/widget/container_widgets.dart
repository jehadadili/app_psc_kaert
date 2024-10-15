import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({super.key, this.child, this.height});
  final Widget? child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: ColorApp.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: child,
    );
  }
}

class BackgroundImageContainer extends StatelessWidget {
  const BackgroundImageContainer({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/home7.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
