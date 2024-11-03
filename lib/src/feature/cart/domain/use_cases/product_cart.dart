import 'package:dartz/dartz.dart';
import 'package:market/src/core/errors/failure.dart';
import 'package:market/src/feature/cart/domain/model/cart_model.dart';
import 'package:market/src/feature/cart/domain/repo/repo.dart';

class GetCartusecass {
  final RepoCart repoCart;

  GetCartusecass({required this.repoCart});

  Future<Either<Failure, List<CartModel>>> productCart() {
    return repoCart.getCart();
  }
}
