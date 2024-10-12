class ErrorModeal {
  final String message;

  ErrorModeal({required this.message});

  factory ErrorModeal.fromjson(Map<String, dynamic> data) {
    return ErrorModeal(
      message: data["message"],
    );
  }
}
