import 'package:dartz/dartz.dart';
import 'package:market/src/core/errors/failure.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

abstract class LabtopReomtData {
  Future<Either<Failure, List<HomeModel>>> getLabtop();
}
