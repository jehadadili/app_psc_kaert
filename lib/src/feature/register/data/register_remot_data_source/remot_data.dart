import 'package:dartz/dartz.dart';
import 'package:market/src/core/errors/failure.dart';
import 'package:market/src/feature/register/domain/model/register_modeal.dart';

abstract class RemotDataSourceregister {
 Future<Either<Failure, RegisterModeal>> addUserRemotDataSource({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String profileImage,
    required String password,
    required String token,
  });

  Future<Either<Failure, RegisterModeal>> login({
    required String email,
    required String password,
  });
}
