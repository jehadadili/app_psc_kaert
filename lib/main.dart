import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/my_app.dart';
import 'package:market/src/core/block/block_observer.dart';
import 'package:market/src/core/di/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  initServiseLocator();
  runApp(const AppShop());
}

