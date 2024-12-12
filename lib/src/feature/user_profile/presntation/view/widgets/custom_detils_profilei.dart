import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';

class CustomDetilsProfilei extends StatelessWidget {
  const CustomDetilsProfilei({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.onPressed,
    this.iconedit,
    required this.editprofile,
    this.controller,
  });
  final IconData icon;
  final IconData? iconedit;
  final String title;
  final String value;
  final void Function()? onPressed;
  final bool editprofile;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E3E),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.pinkAccent,
            size: 24.sp,
          ),
          SizedBox(width: 15.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 2.h),
              editprofile
                  ? Text(
                      value,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : SizedBox(
                      height: 30,
                      width: 150,
                      child: TextField(
                        controller: controller,
                        style: TextStyle(color: ColorApp.white),
                      ),
                    )
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              iconedit,
              color: Colors.blue,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
