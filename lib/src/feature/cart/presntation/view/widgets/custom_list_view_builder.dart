import 'package:flutter/material.dart';
import 'package:market/src/feature/cart/domain/model/cart_model.dart';
import 'package:market/src/feature/cart/presntation/view/widgets/custom_cart_product.dart';

class CustomListViewBuilder extends StatelessWidget {
  const CustomListViewBuilder({super.key, required this.listCart});
  final List<CartModel> listCart;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listCart.length,
      itemBuilder: (context, index) {
        return CustomCartProduct(
          cartModel: listCart[index],
        );
      },
    );
  }
}
