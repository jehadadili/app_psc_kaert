import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market/src/core/api/endpont.dart';
import 'package:market/src/core/errors/failure.dart';
import 'package:market/src/feature/home/data/remot_date/remot_data.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class LabtopRemotDataImp implements LabtopReomtData {
  final Dio dio = Dio();

  @override
  Future<Either<Failure, List<HomeModel>>> getLabtop() async {
    try {
      dio.interceptors.add(LogInterceptor(requestBody: true));
      var respone = await dio.get(Endpont.getLabtop);

      if (respone.statusCode == 200) {
        if (respone.data != null && respone.data["product"] != null) {
          log(respone.statusCode.toString());
          log(respone.data);
          var data = respone.data["product"];
          List<HomeModel> listLabtop =
              List.from((data as List).map((item) => HomeModel.fromjson(item)));
          return right(listLabtop);
        } else {
          throw Exception(" feild product");
        }
      } else {
        throw Exception(" feild product");
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
