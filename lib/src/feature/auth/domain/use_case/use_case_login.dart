import 'package:dartz/dartz.dart';
import 'package:market/src/core/errors/failure.dart';
import 'package:market/src/feature/auth/domain/model/register_modeal.dart';
import 'package:market/src/feature/auth/domain/repository/repository_auth.dart';

class UseCaseLogin {
  final RepositoryAuth repositoryRegister;

  UseCaseLogin({required this.repositoryRegister});

  Future<Either<Failure, AuthModeal>> usecaselogin({
    required String email,
    required String password,
  }) async{
    return await repositoryRegister.loginuser(email: email, password: password);
  }
}
