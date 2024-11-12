import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/feature/cart/domain/model/cart_model.dart';
import 'package:market/src/feature/cart/presntation/view/widgets/custom_item_cart.dart';
import 'package:market/src/feature/cart/presntation/view/widgets/custtom_counter_cart.dart';
import 'package:market/src/feature/cart/presntation/view/widgets/image_product_cart.dart';

class CustomCartProduct extends StatelessWidget {
  const CustomCartProduct({
    super.key,
    required this.cartModel,
  });
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.r),
      child: Card(
        elevation: 10,
        color: const Color(0xfff8f8f8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: SizedBox(
          width: 330.w,
          height: 140.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImageProductCart(
                cartModel: cartModel,
              ),
              CustomItemCart(
                cartModel: cartModel,
              ),
              CustomCounterCart(
                cartModel: cartModel,
              )
            ],
          ),
        ),
      ),
    );
  }
}
