import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/feature/cart/domain/model/cart_model.dart';
import 'package:market/src/feature/cart/presntation/cubit/cubit.dart';

class CustomDeletAndSalse extends StatelessWidget {
  const CustomDeletAndSalse({super.key, required this.cartModel});
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              BlocProvider.of<CartCubit>(context)
                  .deletcart(productId: cartModel.id);
            },
            icon: const Icon(Icons.delete),
            color: ColorApp.red,
          ),
          SizedBox(height: 20.h),
          FittedBox(
            child: Text(
              "\$ ${cartModel.price ?? ""}",
              style: TextStyle(
                color: ColorApp.black,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
