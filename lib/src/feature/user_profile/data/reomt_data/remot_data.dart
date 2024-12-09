import 'package:market/src/feature/auth/domain/model/register_modeal.dart';

abstract class RemotDataprofile {
  Future<AuthModeal> getprofile();
  Future<AuthModeal> ubdateProfile({
    required String name,
    required String email,
    required String phone,
    required String password,
  });
}
