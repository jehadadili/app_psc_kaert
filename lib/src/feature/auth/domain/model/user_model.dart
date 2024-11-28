class UserModel {
  final name;
  final email;
  final phone;
  final nationalId;
  final gender;
  final password;
  final profileImage;
  final token;
  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.nationalId,
    required this.gender,
    required this.profileImage,
    required this.password,
    required this.token,
  });

  factory UserModel.fromeJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      nationalId: json["nationalId"],
      gender: json["gender"],
      profileImage: json["profileImage"],
      password: json["password"],
      token: json["token"],
    );
  }

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
