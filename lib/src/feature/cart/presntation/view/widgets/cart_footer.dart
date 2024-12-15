import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';

class CartFooter extends StatelessWidget {
  final int itemCount;
  final double totalPrice;

  const CartFooter({super.key, required this.itemCount, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: ColorApp.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Total Items: $itemCount",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: ColorApp.black,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Total Price: \$${totalPrice.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: ColorApp.black,
              ),
            ),
            SizedBox(height: 15.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorApp.blue,
                minimumSize: Size(double.infinity, 45.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onPressed: () => Navigator.pushNamed(context, '/checkout'),
              child: Text(
                "Checkout",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorApp.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}