import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:market/src/core/api/endpont.dart';
import 'package:market/src/core/value/value.dart';
import 'package:market/src/feature/auth/domain/model/register_modeal.dart';
import 'package:market/src/feature/user_profile/data/reomt_data/remot_data.dart';

class ReomtDataprofileImp implements RemotDataprofile {
  final Dio dio = Dio();

  @override
  Future<AuthModeal> getprofile() async {
    try {
      var profile = await dio.post(
        Endpont.profile,
        data: {"token": getjehad},
      );

      if (profile.statusCode == 200) {
        log(profile.statusCode.toString());
        var respone = profile.data;
        log(profile.data.toString());
        var user = AuthModeal.fromJson(respone);
        return user;
      } else {
        return Future.error(profile.statusMessage.toString());
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<AuthModeal> ubdateProfile({
    required String name,
    required int email,
    required String phone,
    required int password,
  }) async {
    try {
      var ubdate = await dio.put(Endpont.ubdateprofile, data: {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "token": getjehad,
      });

      if (ubdate.statusCode == 200) {
        log(ubdate.statusCode.toString());
        var data = ubdate.data;
        log(ubdate.data.toString());
        var user = AuthModeal.fromJson(data);
        return user;
      } else {
        return Future.error(ubdate.statusMessage.toString());
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
