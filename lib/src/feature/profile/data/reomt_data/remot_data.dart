import 'package:market/src/feature/auth/domain/model/register_modeal.dart';

abstract class RemotDataprofile {
  Future<AuthModeal> getprofile();
}
