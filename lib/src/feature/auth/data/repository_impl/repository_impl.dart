import 'package:dartz/dartz.dart';
import 'package:market/src/core/errors/failure.dart';
import 'package:market/src/core/errors/server_failuer.dart';
import 'package:market/src/core/network/network_info_impl.dart';
import 'package:market/src/feature/auth/data/auth_remot_data_source/remot_data_imp.dart';
import 'package:market/src/feature/auth/domain/model/register_modeal.dart';
import 'package:market/src/feature/auth/domain/repository/repository_auth.dart';

class RepositoryImpl implements RepositoryAuth {
  final NetworkInfoImpl networkInfoImpl;
  final RemotDataImp remotDataImp;

  RepositoryImpl({
    required this.networkInfoImpl,
    required this.remotDataImp,
  });
  @override
  Future<Either<Failure, AuthModeal>> addUser({
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

  @override
  Future<Either<Failure, AuthModeal>> loginuser(
      {required String email, required String password}) async {
    try {
      if (await networkInfoImpl.isconected) {
        var respone = remotDataImp.login(email: email, password: password);

        return respone;
      } else {
        throw Exception("opps Unknown error");
      }
    } catch (e) {
      return left(ServerFailuer(errormasseig: e.toString()));
    }
  }
}
