import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/src/core/api/endpont.dart';
import 'package:market/src/core/value/value.dart';
import 'package:market/src/feature/cart/domain/use_cases/add_cart.dart';
import 'package:market/src/feature/cart/domain/use_cases/product_cart.dart';
import 'package:market/src/feature/cart/presntation/cubit/state.dart';

class CartCubit extends Cubit<CartState> {
  final AddCartUsecass addCartUsecass;
  final GetCartusecass getCartusecass;
  final Dio dio = Dio();
  static CartCubit get(context) => BlocProvider.of(context);

  CartCubit({required this.addCartUsecass, required this.getCartusecass})
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
    var response = await dio.delete(Endpont.deletCart, data: {
      "nationalId": getkry,
      "productId": productId,
    });

    try {
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        var delet = response.data;
        log(response.data.toString());
        emit(DeletSuccess());
        cartGet();
        return Future.value();
      }
    } catch (e) {
      log(e.toString());
      emit(DeletCart(maesige: e.toString()));
    }
  }
}
