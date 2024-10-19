import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market/src/core/api/endpont.dart';
import 'package:market/src/core/errors/failure.dart';
import 'package:market/src/core/errors/server_failuer.dart';
import 'package:market/src/feature/home/data/remot_date/remot_data.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class LaptopRemotDataImp implements LaptopReomtData {
  final Dio dio = Dio();

  @override
  Future<Either<Failure, List<HomeModel>>> getlaptop() async {
    try {
      dio.interceptors.add(LogInterceptor(requestBody: true));
      var response = await dio.get(Endpont.getlaptop);

      if (response.statusCode == 200) {
        if (response.data != null && response.data["product"] != null) {
          log(response.statusCode.toString());
          log(response.data.toString());

          var data = response.data["product"] as List;
          List<HomeModel> listlaptop =
              data.map((item) => HomeModel.fromjson(item)).toList();

          return Right(listlaptop);
        } else {
          return Left(ServerFailuer(errormasseig: "No product data found"));
        }
      } else {
        return Left(ServerFailuer(
            errormasseig:
                "Server responded with status code: ${response.statusCode}"));
      }
    } on DioException catch (e) {
      log(e.message.toString());

      return Left(ServerFailuer(errormasseig: "Dio error: ${e.message}"));
    } catch (error) {
      log(error.toString());
      return Left(ServerFailuer(errormasseig: "Unexpected error: $error"));
    }
  }
}
