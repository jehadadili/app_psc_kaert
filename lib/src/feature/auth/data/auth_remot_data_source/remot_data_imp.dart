import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market/src/core/api/endpont.dart';
import 'package:market/src/core/errors/failure.dart';
import 'package:market/src/core/errors/server_failuer.dart';
import 'package:market/src/core/helper/cashe_helper.dart';
import 'package:market/src/core/value/value.dart';
import 'package:market/src/feature/auth/data/auth_remot_data_source/remot_data.dart';
import 'package:market/src/feature/auth/domain/model/register_modeal.dart';

class RemotDataImp implements RemotDataSourceAuth {
  final Dio dio;

  RemotDataImp() : dio = Dio() {
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  @override
  Future<Either<Failure, AuthModeal>> addUserRemotDataSource({
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
        var user = AuthModeal.fromJson(data);
        var value =
            CasheHelper.saveData(key: keyjehad, value: user.user!.token);
        log(user.user!.token);
        log("value :  ${value.toString()}");
        return right(user);
      } else {
        return left(ServerFailuer(
          errormasseig:
              "Error ${response.statusCode} : ${response.statusMessage}",
        ));
      }
    } catch (error) {
      return left(ServerFailuer(errormasseig: error.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthModeal>> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await dio.post(Endpont.login, data: {
        "email": email,
        "password": password,
      });

      log(response.statusCode.toString());
      log(response.data.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = response.data;
        var userLogin = AuthModeal.fromJson(data);

        CasheHelper.saveData(key: keyjehad, value: userLogin.user!.token);
        log(userLogin.user!.token.toString());

        return right(userLogin);
      } else {
        return left(ServerFailuer(errormasseig: "Unknown error occurred"));
      }
    } catch (error) {
      return left(ServerFailuer(errormasseig: error.toString()));
    }
  }
}
