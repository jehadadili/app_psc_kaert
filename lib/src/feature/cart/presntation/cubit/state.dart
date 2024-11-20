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

class DeletSuccess extends CartState {}

class DeletLoading extends CartState {}
class DeletCart extends CartState {
  final String maesige;

  DeletCart({required this.maesige});
}
class UbdateSuccess extends CartState {
   final String maesige;

  UbdateSuccess({required this.maesige});

}

class UbdateLoading extends CartState {}
class UbdateCartfiler extends CartState {
  final String maesige;

  UbdateCartfiler({required this.maesige});
}
