import 'package:market/src/feature/cart/domain/model/cart_model.dart';

abstract class CartState {}

class InitialCart extends CartState {}

class AddSuccess extends CartState {}

class LoadingCart extends CartState {}

class SuccessCart extends CartState {
  final List<CartModel> massage;

  SuccessCart({required this.massage});

}

class FilerCart extends CartState {
  final String maesige;

  FilerCart({required this.maesige});
}
