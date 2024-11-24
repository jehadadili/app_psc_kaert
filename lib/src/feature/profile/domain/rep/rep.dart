import 'package:market/src/feature/auth/domain/model/register_modeal.dart';

abstract class RepoProfile {
  Future<AuthModeal> profile();
}
