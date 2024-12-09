import 'package:market/src/feature/auth/domain/model/register_modeal.dart';
import 'package:market/src/feature/user_profile/domain/rep/rep.dart';

class UseCassUbdateProfile {
  final RepoProfile repoProfile;

  UseCassUbdateProfile({required this.repoProfile});

  Future<AuthModeal> useUbdateProfile({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    return await repoProfile.ubdateProfile(
        name: name, email: email, phone: phone, password: password);
  }
}
