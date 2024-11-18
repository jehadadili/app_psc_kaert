import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/my_app.dart';
import 'package:market/src/core/block/block_observer.dart';
import 'package:market/src/core/di/service_locator.dart';
import 'package:market/src/core/helper/cashe_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CasheHelper.init();
  initServiseLocator();
  runApp(
       DevicePreview(
       enabled: !kReleaseMode,
       builder: (context) =>
    const AppShop(),
     )
  );
}
