import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/feature/cart/presntation/cubit/cubit.dart';
import 'package:market/src/feature/cart/presntation/cubit/state.dart';
import 'package:market/src/feature/cart/presntation/view/widgets/cart_loading_state.dart';
import 'package:market/src/feature/cart/presntation/view/widgets/cart_state_listener.dart';
import 'package:market/src/feature/cart/presntation/view/widgets/cart_success_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[500],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[500],
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
        listener: CartStateListener().listener,
        builder: (context, state) {
          if (state is LoadingCart) return const CartLoadingState();
          if (state is SuccessCart) return CartSuccessState(state: state);
          if (state is FilerCart) return Center(child: Text(state.maesige));
          return const SizedBox();
        },
      ),
    );
  }
}
