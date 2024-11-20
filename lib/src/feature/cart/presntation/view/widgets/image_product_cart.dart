import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/feature/cart/domain/model/cart_model.dart';

class ImageProductCart extends StatelessWidget {
  const ImageProductCart({super.key, required this.cartModel});
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130.w,
      child: Image.network(
        cartModel.image ?? "",
        width: 230.w,
        height: 200.h,
      ),
    );
  }
}
