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

  CartCubit({
    required this.putUbdateCart,
    required this.getDeleteCart,
    required this.addCartUsecass,
    required this.getCartusecass,
  }) : super(InitialCart()) {
    cartGet();
  }

  /// إضافة منتج إلى السلة
  Future<void> addCart({required String id}) async {
    emit(LoadingCart());
    try {
      var response = await addCartUsecass.addCart(id: id);
      log("Add Cart Response: $response");
      emit(AddSuccess());
      cartGet(); // تحديث السلة بعد الإضافة
    } catch (e) {
      log("Error in AddCart: $e");
      emit(FilerCart(maesige: "Error adding to cart"));
    }
  }

  /// جلب المنتجات في السلة
  Future<void> cartGet() async {
    emit(LoadingCart());
    try {
      var product = await getCartusecass.productCart();

      product.fold(
        (failure) {
          log("Error in Cubit: ${failure.errormasseig}");
          emit(FilerCart(maesige: failure.errormasseig ?? "Unknown error"));
        },
        (success) {
          log("Data fetched successfully in Cubit: $success");
          emit(SuccessCart(massage: success)); // نجاح جلب البيانات
        },
      );
    } catch (e) {
      log("Unexpected Error in cartGet: $e");
      emit(FilerCart(maesige: "Unexpected Error in fetching cart"));
    }
  }

  /// حذف منتج من السلة
  Future<void> deletcart({required String productId}) async {
    emit(DeletLoading());
    try {
      var response = await getDeleteCart.deletecart(productId: productId);
      log("Delete Cart Response: $response");
      emit(DeletSuccess());
      cartGet(); // تحديث السلة بعد الحذف
    } catch (e) {
      log("Error in DeleteCart: $e");
      emit(FilerCart(maesige: "Error deleting from cart"));
    }
  }

  /// تحديث الكمية في السلة
  Future<void> ubdatecart(
      {required String productId, required int quantity}) async {
    emit(UbdateLoading());
    try {
      var ubdate = await putUbdateCart.ubdatecart(
        productId: productId,
        quantity: quantity,
      );

      ubdate.fold(
        (failure) {
          log("Error in UpdateCart: ${failure.errormasseig}");
          emit(UbdateCartfiler(
              maesige: failure.errormasseig ?? "Unknown error"));
        },
        (listCart) {
          log("Update Success: $listCart");
          emit(UbdateSuccess(
              maesige: "Updated successfully", cartList: listCart));
          cartGet();
        },
      );
    } catch (e) {
      log("Unexpected Error in UpdateCart: $e");
      emit(FilerCart(maesige: "Unexpected Error in updating cart"));
    }
  }
}
