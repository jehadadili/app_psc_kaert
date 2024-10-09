class UserModel {
  final String name;
  final String email;
  final String phone;
  final String nationalId;
  final String gender;
  final String password;
  final String profileImage;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.nationalId,
    required this.gender,
    required this.profileImage,
    required this.password,
  });

  factory UserModel.fromeJson(Map<String, dynamic> json) {
    return UserModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        nationalId: json["nationalId"],
        gender: json["gender"],
        profileImage: json["profileImage"],
        password: json["password"]);
  }

  static fromejson(data) {}

  // Map<String, dynamic> tojson = {
  //   "name" = name ,
  //   "email": email,
  //   "phone": phone,
  //   "nationalId": nationalId,
  //   "gender": gender,
  //   "profileImage": profileImage,
  //   "password": password,
  // };
}
