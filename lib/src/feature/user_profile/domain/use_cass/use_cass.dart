import 'package:market/src/feature/auth/domain/model/register_modeal.dart';
import 'package:market/src/feature/user_profile/domain/rep/rep.dart';

class UseCassprofile {
  final RepoProfile repoProfile;

  UseCassprofile({required this.repoProfile});

  Future<AuthModeal> profileusecass() async {
    return await repoProfile.profile();
  }
}
