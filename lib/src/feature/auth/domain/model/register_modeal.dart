import 'package:market/src/feature/auth/domain/model/user_model.dart';

class AuthModeal {
   String? status;
  final String? message;
  final UserModel? user;
  AuthModeal({
    required this.status,
    required this.message,
    required this.user,
  });

  factory AuthModeal.fromejson(Map<String, dynamic> josn) {
    return AuthModeal(
      status: josn["status"],
      message: josn["message"],
      user: josn["user"] != null ? UserModel.fromeJson(josn["user"]) : null,
    );
  }
}
