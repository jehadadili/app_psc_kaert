import 'package:market/src/feature/auth/domain/model/register_modeal.dart';

abstract class RemotDataprofile {
  Future<AuthModeal> getprofile();
  Future<AuthModeal> ubdateProfile({
    required String name,
    required int email,
    required String phone,
    required int password,
  });
}
