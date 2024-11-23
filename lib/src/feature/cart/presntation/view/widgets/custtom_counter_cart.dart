import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/feature/cart/presntation/cubit/cubit.dart';

class CustomCounterCart extends StatelessWidget {
  final String productId;
  final int quantity;

  const CustomCounterCart({
    super.key,
    required this.productId,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              BlocProvider.of<CartCubit>(context).ubdatecart(
                productId: productId,
                quantity: quantity + 1, // زيادة الكمية
              );
            },
            icon: const Icon(
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
                  "$quantity",
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
            onPressed: () {
              if (quantity > 1) {
                BlocProvider.of<CartCubit>(context).ubdatecart(
                  productId: productId,
                  quantity: quantity - 1, // تقليل الكمية
                );
              }
            },
            icon: const Icon(
              Icons.remove,
              color: ColorApp.blue,
            ),
          ),
        ],
      ),
    );
  }
}
