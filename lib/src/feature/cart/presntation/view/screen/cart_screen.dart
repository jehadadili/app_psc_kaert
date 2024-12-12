import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/feature/cart/presntation/cubit/cubit.dart';
import 'package:market/src/feature/cart/presntation/cubit/state.dart';
import 'package:market/src/feature/cart/presntation/view/widgets/custom_list_view_builder.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.bluee,
      appBar: AppBar(
        backgroundColor: ColorApp.bluee,
        iconTheme: const IconThemeData(color: ColorApp.white),
        elevation: 0,
        title: Text(
          "My Cart",
          style: TextStyle(
            color: ColorApp.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is FilerCart) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.maesige)),
            );
          }
        },
        builder: (context, state) {
          if (state is LoadingCart) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "جاري تحديث البيانات... يرجى الانتظار.",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: ColorApp.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const CircularProgressIndicator(),
                ],
              ),
            );
          } else if (state is SuccessCart) {
            final cartItems = state.massage;
            final totalPrice = cartItems.fold<double>(
                0, (sum, item) => sum + item.totalPrice - item.sales);
            final itemCount = cartItems.length;

            return Column(
              children: [
                Expanded(
                  child: CustomListViewBuilder(listCart: cartItems),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
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
                          onPressed: () {
                            // Navigate to Checkout Page
                            Navigator.pushNamed(context, '/checkout');
                          },
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
                ),
              ],
            );
          } else if (state is FilerCart) {
            return Center(child: Text(state.maesige));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
