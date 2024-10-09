import 'package:market/src/feature/register/domain/model/user_model.dart';

class RegisterModeal {
   String? status;
  final String? message;
  final UserModel? user;
  RegisterModeal({
    required this.status,
    required this.message,
    required this.user,
  });

  factory RegisterModeal.fromejson(Map<String, dynamic> josn) {
    return RegisterModeal(
      status: josn["status"],
      message: josn["message"],
      user: josn["user"] != null ? UserModel.fromeJson(josn["user"]) : null,
    );
  }
}
