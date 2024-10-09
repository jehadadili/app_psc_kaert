import 'package:market/src/feature/register/domain/model/register_modeal.dart';

abstract class RepositoryRegister {
  Future<RegisterModeal> addUser({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String profileImage,
    required String password,
  });
}
