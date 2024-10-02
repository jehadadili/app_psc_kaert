import 'package:flutter/material.dart';

extension NavgterWighet on BuildContext {
  Future<dynamic> pushwidget({required Widget push}) {
    return Navigator.push(this, MaterialPageRoute(builder: (context) => push));
  }

  Future<dynamic> pushReplacement({required Widget pushReplacement}) {
    return Navigator.pushReplacement(
        this, MaterialPageRoute(builder: (context) => pushReplacement));
  }
}
