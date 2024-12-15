import 'package:flutter/material.dart';
import 'package:market/src/feature/cart/presntation/cubit/state.dart';

class CartStateListener {
  void listener(BuildContext context, CartState state) {
    if (state is FilerCart) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.maesige)),
      );
    }
  }
}