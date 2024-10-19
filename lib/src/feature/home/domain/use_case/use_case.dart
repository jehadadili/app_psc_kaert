import 'package:dartz/dartz.dart';
import 'package:market/src/core/errors/failure.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';
import 'package:market/src/feature/home/domain/repo/repo.dart';

class LaptopUseCase {
  final ReopHome reopHome;
  LaptopUseCase({required this.reopHome});

  Future<Either<Failure, List<HomeModel>>> laptopuseCase()  {
    return  reopHome.getlaptop();
  }
}
