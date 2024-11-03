import 'package:market/src/feature/cart/domain/repo/repo.dart';

class AddCartUsecass {
  final RepoCart repoCart;

  AddCartUsecass({required this.repoCart});

  addCart({required String id}) {
    return repoCart.addCart(id: id);
  }
}
