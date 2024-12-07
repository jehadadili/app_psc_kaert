import 'package:market/src/feature/auth/domain/model/register_modeal.dart';

abstract class RepoProfile {
  Future<AuthModeal> profile();
  Future<AuthModeal> ubdateProfile({
    required String name,
    required int email,
    required String phone,
    required int password,
  });
}
