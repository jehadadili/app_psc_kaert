import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';

import '../../../../../core/style/image/image_app.dart';

class CustomContainerAppbar extends StatelessWidget {
  const CustomContainerAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorApp.charcoalBlue,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10).r,
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                Image.asset(
                  ImageApp.logo1,
                  width: 60.w,
                ),
                Text(
                  "PSD",
                  style: TextStyle(
                      color: ColorApp.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "KART",
                  style: TextStyle(
                      color: ColorApp.bluedark,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    color: ColorApp.white,
                    size: 35.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).r,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xffF2F2F2),
                ),
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
