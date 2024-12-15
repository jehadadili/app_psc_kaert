import 'package:market/src/feature/auth/domain/model/user_model.dart';


class AuthModeal{
  String? status;
  String? message;
  UserModel ? user;

  AuthModeal({
    required this.status,
    required this.message,
    required this.user
  });

  factory AuthModeal.fromJson(Map<String, dynamic> json) {
    return AuthModeal(

        status: json['status'] ,
        message: json['message'] ,
        user: json['user'] != null
            ? UserModel.fromeJson(json['user'] )
            : null
    );
  }

  void then(Null Function(dynamic value) param0) {}
}