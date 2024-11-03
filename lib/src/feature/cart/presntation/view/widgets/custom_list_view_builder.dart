import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:market/src/feature/cart/domain/model/cart_model.dart';
import 'package:market/src/feature/cart/presntation/view/widgets/custom_cart_product.dart';

class CustomListViewBuilder extends StatelessWidget {
  const CustomListViewBuilder({super.key, required this.listCart});
  final List<CartModel> listCart;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: listCart.length,
        itemBuilder: (context, index) {
          return Slidable(
            key: ValueKey(listCart[index].id), 
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: [
                SlidableAction(
                  onPressed: (context) {},
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: CustomCartProduct(
              cartModel: listCart[index],
            ),
          );
        },
      ),
    );
  }
}
