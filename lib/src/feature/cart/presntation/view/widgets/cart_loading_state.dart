import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';

class CartLoadingState extends StatelessWidget {
  const CartLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "جاري تحديث البيانات... يرجى الانتظار.",
            style: TextStyle(
              fontSize: 16.sp,
              color: ColorApp.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}