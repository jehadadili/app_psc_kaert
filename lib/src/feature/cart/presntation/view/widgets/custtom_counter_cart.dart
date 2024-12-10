import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/feature/cart/presntation/cubit/cubit.dart';

class CustomCounterCart extends StatelessWidget {
  final String productId;
  final int quantity;
  final double total;

  const CustomCounterCart({
    super.key,
    required this.productId,
    required this.quantity,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller =
        TextEditingController(text: quantity.toString());

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // زر الإضافة
            Flexible(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  BlocProvider.of<CartCubit>(context).ubdatecart(
                    productId: productId,
                    quantity: quantity + 1,
                  );
                },
                icon: Icon(
                  Icons.add,
                  color: ColorApp.blue,
                  size: 24.r,
                ),
              ),
            ),

            // حقل النص لعرض الكمية
            Flexible(
              flex: 2,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                color: ColorApp.charcoalBlue,
                child: SizedBox(
                  width: 50.w,
                  height: 40.h,
                  child: Center(
                    child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorApp.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) {
                        int newQuantity = int.tryParse(value) ?? quantity;
                        if (newQuantity != quantity) {
                          BlocProvider.of<CartCubit>(context).ubdatecart(
                            productId: productId,
                            quantity: newQuantity,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),

            // زر الإنقاص
            Flexible(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  if (quantity > 1) {
                    BlocProvider.of<CartCubit>(context).ubdatecart(
                      productId: productId,
                      quantity: quantity - 1,
                    );
                  }
                },
                icon: Icon(
                  Icons.remove,
                  color: ColorApp.blue,
                  size: 24.r,
                ),
              ),
            ),
          ],
        ),

        // عرض المجموع
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: Text(
            "\$ $total",
            style: TextStyle(
              color: ColorApp.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
