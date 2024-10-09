import 'package:market/src/core/network/network_info_impl.dart';
import 'package:market/src/feature/register/data/register_remot_data_source/remot_data_imp.dart';
import 'package:market/src/feature/register/domain/model/register_modeal.dart';
import 'package:market/src/feature/register/domain/repository/repository_register.dart';

class RepositoryImpl implements RepositoryRegister {
  final NetworkInfoImpl networkInfoImpl;
  final RemotDataImp remotDataImp;

  RepositoryImpl({
    required this.networkInfoImpl,
    required this.remotDataImp,
  });
  @override
  Future<RegisterModeal> addUser({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String profileImage,
    required String password,
    required String token,
  }) async {
    try {
      if (await networkInfoImpl.isconected) {
        var response = await remotDataImp.addUserRemotDataSource(
          name: name,
          email: email,
          phone: phone,
          nationalId: nationalId,
          gender: gender,
          profileImage: profileImage,
          password: password,
          token: token,
        );
        return response;
      } else {
        return Future.error("opps Unknown error");
      }
    } catch (error) {
      return Future.error("ERROR RIGSTER $error".toString());
    }
  }
}
