import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';

class CustomCounterCart extends StatelessWidget {
  const CustomCounterCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.add,
            color: ColorApp.blue,
          ),
        ),
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          color: ColorApp.charcoalBlue,
          child: SizedBox(
            width: 35.w,
            height: 35.h,
            child: Center(
              child: Text(
                "5",
                style: TextStyle(
                  color: ColorApp.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.remove,
            color: ColorApp.blue,
          ),
        ),
      ],
    );
  }
}
