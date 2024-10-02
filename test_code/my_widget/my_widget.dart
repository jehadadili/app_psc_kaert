import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/number_cubit.dart';
import '../cubit/number_state.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    NumberCubit cubit = NumberCubit().get(context);
    log(cubit.x.toString());
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocConsumer<NumberCubit, NumberState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(cubit.x.toString()),
                ElevatedButton(
                    onPressed: () {
                      cubit.number();
                    },
                    child: const Text("add"))
              ],
            );
          },
        ),
      ),
    );
  }
}