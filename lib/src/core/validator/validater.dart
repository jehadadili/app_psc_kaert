class MyValidator {
  static String? nameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return "name is requred";
    }
    return null;
  }

  static String? emalValidator(String? email) {
    if (email == null || email.isEmpty) {
      return "email is requred";
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(email)) {
      return "pleas enter a valid email ";
    }
    return null;
  }

  static String? phoneValidator(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "phone is requred";
    }
    if (phone.length != 11) {
      return "pleas enter a valid phone 11 number ";
    }
    if (!phone.startsWith("010")) {
      return "Phone number must start with 010";
    }
    return null;
  }

  static String? idValidator(String? id) {
    if (id == null || id.isEmpty) {
      return "id is requred";
    }
    if (id.length != 14) {
      return "pleas enter a valid id 14 number ";
    }

    return null;
  }

  static String? gendrValidator(String? gender) {
    if (gender == null || gender.isEmpty) {
      return "gender is requred";
    }

    return null;
  }

  static String? passwrdValidator(String? paswword) {
    if (paswword == null || paswword.isEmpty) {
      return "paswword is requred";
    }
    if (paswword.length != 6) {
      return "pleas enter a valid id 6 number ";
    }

    return null;
  }

  static String? tokenValidator(String? token) {
    if (token == null || token.isEmpty) {
      return "token is requred";
    }

    return null;
  }
}
