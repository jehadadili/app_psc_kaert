import 'package:flutter/material.dart';
import 'package:market/src/feature/cart/presntation/cubit/state.dart';
import 'package:market/src/feature/cart/presntation/view/widgets/cart_footer.dart';
import 'package:market/src/feature/cart/presntation/view/widgets/custom_list_view_builder.dart';

class CartSuccessState extends StatelessWidget {
  final SuccessCart state;

  const CartSuccessState({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cartItems = state.massage;
    final totalPrice = cartItems.fold<double>(
        0, (sum, item) => sum + item.totalPrice - item.sales);
    final itemCount = cartItems.length;

    return Column(
      children: [
        Expanded(
          child: CustomListViewBuilder(listCart: cartItems),
        ),
        CartFooter(itemCount: itemCount, totalPrice: totalPrice),
      ],
    );
  }
}