import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/feature/cart/domain/model/cart_model.dart';
import 'package:market/src/feature/cart/presntation/view/widgets/custtom_counter_cart.dart';

class CustomItemCart extends StatelessWidget {
  const CustomItemCart({
    super.key,
    required this.cartModel,
  });
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: Text(
              cartModel.name ?? "",
              style: TextStyle(
                color: ColorApp.blue,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          CustomCounterCart(
            productId: cartModel.id,
            quantity: cartModel.quantity,
            total: cartModel.totalPrice,
          )
        ],
      ),
    );
  }
}
