import 'package:dartz/dartz.dart';
import 'package:market/src/core/errors/failure.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';
import 'package:market/src/feature/home/domain/repo/repo.dart';

class LabtopUseCase {
  final ReopHome reopHome;
  LabtopUseCase({required this.reopHome});

  Future<Either<Failure, List<HomeModel>>> labtopUseCase() async {
    return await reopHome.getLabtop();
  }
}
