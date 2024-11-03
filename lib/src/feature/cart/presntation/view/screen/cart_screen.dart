import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/core/widget/custom_lodaing_home.dart';
import 'package:market/src/feature/cart/presntation/cubit/cubit.dart';
import 'package:market/src/feature/cart/presntation/cubit/state.dart';
import 'package:market/src/feature/cart/presntation/view/widgets/custom_list_view_builder.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorApp.white,
        appBar: AppBar(
          backgroundColor: ColorApp.white,
          elevation: 0,
          title: Text(
            "My Cart",
            style: TextStyle(
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
              return const ShimmerLoading();
            } else if (state is SuccessCart) {
              return CustomListViewBuilder(listCart: state.massage);
            } else if (state is FilerCart) {
              return Center(child: Text(state.maesige));
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}
