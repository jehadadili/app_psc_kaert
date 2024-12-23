import 'package:market/src/core/network/network_info_impl.dart';
import 'package:market/src/feature/auth/domain/model/register_modeal.dart';
import 'package:market/src/feature/user_profile/data/reomt_data/reomt_data_imp.dart';
import 'package:market/src/feature/user_profile/domain/rep/rep.dart';

class RepoProfileImp implements RepoProfile {
  final NetworkInfoImpl networkInfoImpl;
  final ReomtDataprofileImp reomtDataprofileImp;
  RepoProfileImp({
    required this.networkInfoImpl,
    required this.reomtDataprofileImp,
  });
  @override
  Future<AuthModeal> profile() async {
    try {
      if (await networkInfoImpl.isconected) {
        var profile = await reomtDataprofileImp.getprofile();
        return profile;
      } else {
        return Future.error("خطأ في تحميل الداتا ");
      }
    } catch (error) {
      return Future.error(error.toString());
    }
  }

  @override
  Future<AuthModeal> ubdateProfile({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      if (await networkInfoImpl.isconected) {
        var ubdate = await reomtDataprofileImp.ubdateProfile(
            name: name, email: email, phone: phone, password: password);
        return ubdate;
      } else {
        return Future.error("خطأ في تحميل الداتا ");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
