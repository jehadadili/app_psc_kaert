import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/src/feature/cart/domain/use_cases/add_cart.dart';
import 'package:market/src/feature/cart/domain/use_cases/delete_cart.dart';
import 'package:market/src/feature/cart/domain/use_cases/product_cart.dart';
import 'package:market/src/feature/cart/domain/use_cases/ubdate_cart.dart';
import 'package:market/src/feature/cart/presntation/cubit/state.dart';

class CartCubit extends Cubit<CartState> {
  final AddCartUsecass addCartUsecass;
  final GetCartusecass getCartusecass;
  final GetDeleteCart getDeleteCart;
  final PutUbdateCart putUbdateCart;
  final Dio dio = Dio();
  static CartCubit get(context) => BlocProvider.of(context);

  CartCubit(
      {required this.putUbdateCart,
      required this.getDeleteCart,
      required this.addCartUsecass,
      required this.getCartusecass})
      : super(InitialCart()) {
    cartGet();
  }
  addCart({required String id}) async {
    emit(LoadingCart());
    var respone = await addCartUsecass.addCart(id: id);
    emit(AddSuccess());
    cartGet();
    return respone;
  }

  void cartGet() async {
    emit(LoadingCart());

    var product = await getCartusecass.productCart();

    product.fold(
      (failure) {
        log("Error in Cubit: ${failure.errormasseig}");
        emit(FilerCart(maesige: failure.errormasseig ?? "Unknown error"));
      },
      (success) {
        log("Data fetched successfully in Cubit");
        emit(SuccessCart(massage: success));
      },
    );
  }

  deletcart({required String productId}) async {
    emit(DeletLoading());
    var response = await getDeleteCart.deletecart(productId: productId);
    emit(DeletSuccess());
    cartGet();
    return response;
  }

  ubdatecart({required String productId, required int quantity}) async {
    emit(UbdateLoading());
    var ubdate = await putUbdateCart.ubdatecart(
        productId: productId, quantity: quantity);
    ubdate.fold(
      (failure) {
        log("Error in Cubit: ${failure.errormasseig}");
        emit(UbdateCartfiler(maesige: failure.errormasseig ?? "Unknown error"));
      },
      (success) {
        log("Data fetched successfully in Cubit");
        emit(UbdateSuccess(maesige: success));
        cartGet();
      },
    );
  }
}
