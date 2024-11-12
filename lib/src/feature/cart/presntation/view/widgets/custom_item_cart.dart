import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/feature/cart/domain/model/cart_model.dart';
import 'package:market/src/feature/cart/presntation/cubit/cubit.dart';

class CustomItemCart extends StatelessWidget {
  const CustomItemCart({
    super.key,
    required this.cartModel,
  });
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            cartModel.name,
            style: TextStyle(
              color: ColorApp.blue,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            cartModel.company,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "\$ ${cartModel.price}",
            style: TextStyle(
              color: ColorApp.black,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
          IconButton(
              onPressed: () {
                BlocProvider.of<CartCubit>(context)
                    .deletcart(productId: cartModel.id);
              },
              icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}
