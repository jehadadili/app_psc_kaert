import 'package:market/src/feature/cart/domain/repo/repo.dart';

class PutUbdateCart {
  final RepoCart repoCart;

  PutUbdateCart({required this.repoCart});

  ubdatecart({required String productId, required int quantity}) {
    return repoCart.ubdatecart(productId: productId, quantity: quantity);
  }
}
