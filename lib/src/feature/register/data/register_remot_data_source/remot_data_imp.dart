import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market/src/core/api/endpont.dart';
import 'package:market/src/core/errors/failure.dart';
import 'package:market/src/core/errors/server_failuer.dart';
import 'package:market/src/feature/register/data/register_remot_data_source/remot_data.dart';
import 'package:market/src/feature/register/domain/model/register_modeal.dart';

class RemotDataImp implements RemotDataSourceregister {
  final Dio dio = Dio();
  @override
  Future<RegisterModeal> addUserRemotDataSource({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String profileImage,
    required String password,
    required String token,
  }) async {
    try {
      dio.interceptors.add(LogInterceptor(responseBody: true));
      var response = await dio.post(Endpont.register, data: {
        "name": name,
        "email": email,
        "phone": phone,
        "nationalId": nationalId,
        "gender": gender,
        "profileImage": profileImage,
        "password": password,
        "token": token,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.toString());
        var data = response.data;
        var user = RegisterModeal.fromejson(data);
        return user;
      } else {
        return Future.error(ServerFailuer(
            errormasseig:
                "this is error ???  ${response.statusCode} :  ${response.statusMessage}"));
      }
    } catch (error) {
      return Future.error("this is error ???  $error");
    }
  }

  @override
  Future<Either<Failure, RegisterModeal>> login(
      {required String email, required String password}) async {
    try {
      var respone = await dio.post(Endpont.login, data: {
        "email": email,
        "password": password,
      });
      log(respone.statusCode.toString());
      log(respone.data.toString());
      if (respone.statusCode == 200 || respone.statusCode == 201) {
        var data = respone.data;
        var userLogin = RegisterModeal.fromejson(data);
        return right(userLogin);
      } else {
        throw ServerFailuer(errormasseig: "opps Unknown error");
      }
    } catch (error) {
      return left(ServerFailuer(errormasseig: error.toString()));
    }
  }
}
