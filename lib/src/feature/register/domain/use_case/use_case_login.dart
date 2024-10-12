import 'package:dartz/dartz.dart';
import 'package:market/src/core/errors/failure.dart';
import 'package:market/src/feature/register/domain/model/register_modeal.dart';
import 'package:market/src/feature/register/domain/repository/repository_register.dart';

class UseCaseLogin {
  final RepositoryRegister repositoryRegister;

  UseCaseLogin({required this.repositoryRegister});

  Future<Either<Failure, RegisterModeal>> usecaselogin({
    required String email,
    required String password,
  }) async{
    return await repositoryRegister.loginuser(email: email, password: password);
  }
}
