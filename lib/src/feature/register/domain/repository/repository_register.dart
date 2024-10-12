import 'package:dartz/dartz.dart';
import 'package:market/src/core/errors/failure.dart';
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
    required String token,
  });

  Future<Either<Failure, RegisterModeal>> loginuser({
    required String email,
    required String password,
  });
}
