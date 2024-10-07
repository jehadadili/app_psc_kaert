import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/color/color_app.dart';

class CustomButtomWidget extends StatelessWidget {
  const CustomButtomWidget(
      {super.key, this.onPressed, required this.text, required this.icon});
  final void Function()? onPressed;
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
      child: MaterialButton(
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorApp.red,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: ColorApp.white,
                size: 25.sp,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                text,
                style: TextStyle(
                    color: ColorApp.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
