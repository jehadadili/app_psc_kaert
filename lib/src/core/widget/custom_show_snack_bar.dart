import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showSnackBar(
    {required BuildContext context,
    required String text,
    required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Center(
        child: Text(
      text,
      style: TextStyle(fontSize: 20.sp),
    )),
    backgroundColor: color,
  ));
}
