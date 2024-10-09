import 'package:market/src/feature/register/domain/model/register_modeal.dart';

abstract class RemotDataSourceregister {
  Future<RegisterModeal> addUserRemotDataSource({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String profileImage,
    required String password,
    required String token,
  });
}
