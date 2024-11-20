import 'package:market/src/feature/cart/domain/repo/repo.dart';

class GetDeleteCart {
  final RepoCart repoCart;

  GetDeleteCart({required this.repoCart});

  deletecart({required String productId}) {
    return repoCart.deletcart(productId: productId);
  }
}
