import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:market/src/core/errors/failure.dart';
import 'package:market/src/core/errors/server_failuer.dart';
import 'package:market/src/core/network/network_info_impl.dart';
import 'package:market/src/feature/home/data/remot_date/remot_data_imp.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';
import 'package:market/src/feature/home/domain/repo/repo.dart';

class LaptopRepoImpl implements ReopHome {
  final LaptopRemotDataImp laptopRemotDataImp;
  final NetworkInfoImpl networkInfoImpl;
  LaptopRepoImpl({
    required this.laptopRemotDataImp,
    required this.networkInfoImpl,
  });
  @override
  Future<Either<Failure, List<HomeModel>>> getlaptop() async {
    try {
      if (await networkInfoImpl.isconected) {
        var response = await laptopRemotDataImp.getlaptop();
        return response;
      } else {
        return Left(ServerFailuer(errormasseig: "No internet connection"));
      }
    } catch (error) {
      log("Error: $error");
      return Left(ServerFailuer(errormasseig: "An unexpected error occurred"));
    }
  }
}
