import 'package:dartz/dartz.dart';
import 'package:market/src/core/errors/failure.dart';
import 'package:market/src/feature/register/domain/model/register_modeal.dart';
import 'package:market/src/feature/register/domain/repository/repository_register.dart';

class AddUserUseCase {
  final RepositoryRegister repositoryRegister;

  AddUserUseCase({
    required this.repositoryRegister,
  });

  Future<Either<Failure, RegisterModeal>> addUserUsecaseRegister({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String profileImage,
    required String password,
    required String token,
  }) async {
    return await repositoryRegister.addUser(
      name: name,
      email: email,
      phone: phone,
      nationalId: nationalId,
      gender: gender,
      profileImage: profileImage,
      password: password,
      token: token,
    );
  }
}
