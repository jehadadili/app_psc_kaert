import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/feature/cart/domain/model/cart_model.dart';
import 'package:market/src/feature/cart/presntation/view/widgets/custom_delet_and_salse.dart';
import 'package:market/src/feature/cart/presntation/view/widgets/custom_item_cart.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Card(
        elevation: 10,
        color: ColorApp.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: SizedBox(
          height: 140.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: ImageProductCart(cartModel: cartModel),
              ),
              Flexible(
                flex: 3,
                child: CustomItemCart(cartModel: cartModel),
              ),
              Flexible(
                flex: 2,
                child: CustomDeletAndSalse(cartModel: cartModel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
