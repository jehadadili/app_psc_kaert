import 'package:dartz/dartz.dart';
import 'package:market/src/core/errors/failure.dart';
import 'package:market/src/feature/cart/domain/model/cart_model.dart';

abstract class RepoCart {
  addCart({required String id});

  Future<Either<Failure, List<CartModel>>> getCart();

  //deletcart({required String nationalId, required String productId});
}
