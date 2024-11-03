import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/src/feature/cart/domain/use_cases/add_cart.dart';
import 'package:market/src/feature/cart/domain/use_cases/product_cart.dart';
import 'package:market/src/feature/cart/presntation/cubit/state.dart';

class CartCubit extends Cubit<CartState> {
  final AddCartUsecass addCartUsecass;
  final GetCartusecass getCartusecass;
  static CartCubit get(context) => BlocProvider.of(context);

  CartCubit({required this.addCartUsecass, required this.getCartusecass})
      : super(InitialCart());
  addCart({required String id}) async {
    emit(LoadingCart());
    var respone = await addCartUsecass.addCart(id: id);
    emit(AddSuccess());
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
}
