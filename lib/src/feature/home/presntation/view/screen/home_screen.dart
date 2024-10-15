import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/src/core/di/service_locator.dart';
import 'package:market/src/feature/home/presntation/cubit/cubit.dart';
import 'package:market/src/feature/home/presntation/cubit/state.dart';
import 'package:market/src/feature/home/presntation/view/widgets/custom_success.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<LabtopCubit>()..labtopCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<LabtopCubit, LabtopState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LabtopSuccess) {
              return BodywidgetSuccess(
                listlabtop: state.lab,
              );
            } else if (state is LabtopLoading) {
              return CircularProgressIndicator();
            } else if (state is LabtopFulier) {
              return Text(state.error);
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
