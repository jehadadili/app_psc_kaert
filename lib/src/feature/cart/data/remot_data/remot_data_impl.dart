import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market/src/core/api/endpont.dart';
import 'package:market/src/core/errors/failure.dart';
import 'package:market/src/core/errors/server_failuer.dart';
import 'package:market/src/core/value/value.dart';
import 'package:market/src/feature/cart/data/remot_data/remot_data.dart';
import 'package:market/src/feature/cart/domain/model/cart_model.dart';

class RemotDataImplCart implements RemotDatacart {
  final Dio dio = Dio();

  @override
  addCart({required String id}) async {
    var respone = await dio.post(Endpont.addCart, data: {
      "nationalId": getkry,
      "productId": id,
      "quantity": "1",
    });
    var data = respone.data;
    log(data.toString());
    return Future.value();
  }

  @override
  Future<Either<Failure, List<CartModel>>> getCart() async {
    try {
      dio.interceptors.add(LogInterceptor(requestBody: true));
      var response = await dio.get(Endpont.getCart, data: {
        "nationalId":getkry,
      });
      if (response.statusCode == 200) {
        if (response.data != null && response.data["products"] != null) {
          log(response.statusCode.toString());
          log(response.data.toString());
          var data = response.data["products"] as List;
          List<CartModel> listcart =
              data.map((item) => CartModel.fromJson(item)).toList();

          return Right(listcart);
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
