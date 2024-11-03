import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:market/src/core/errors/failure.dart';
import 'package:market/src/core/errors/server_failuer.dart';
import 'package:market/src/core/network/network_info_impl.dart';
import 'package:market/src/feature/cart/data/remot_data/remot_data_impl.dart';
import 'package:market/src/feature/cart/domain/model/cart_model.dart';
import 'package:market/src/feature/cart/domain/repo/repo.dart';

class RepoCartImple implements RepoCart {
  final RemotDataImplCart remotDataImplCart;
  final NetworkInfoImpl networkInfoImpl;

  RepoCartImple(
      {required this.remotDataImplCart, required this.networkInfoImpl});
  @override
  addCart({required String id}) async {
    if (await networkInfoImpl.isconected) {
      var respone = await remotDataImplCart.addCart(id: id);
      return respone;
    }
  }

  @override
  Future<Either<Failure, List<CartModel>>> getCart() async {
    try {
      if (await networkInfoImpl.isconected) {
        var respons = await remotDataImplCart.getCart();
        return respons;
      } else {
        return Left(ServerFailuer(errormasseig: "No internet connection"));
      }
    } catch (error) {
      log("Error: $error");
      return Left(ServerFailuer(errormasseig: "An unexpected error occurred"));
    }
  }
}
