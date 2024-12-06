import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/di/service_locator.dart';
import 'package:market/src/core/widget/custom_lodaing_home.dart';
import 'package:market/src/feature/home/presntation/cubit/cubit.dart';
import 'package:market/src/feature/home/presntation/cubit/state.dart';
import 'package:market/src/feature/home/presntation/view/widgets/body_widgets_success.dart';
import 'package:market/src/feature/sflow/slow.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<LaptopCubit>()..fetchLaptops(),
      child: Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: BlocConsumer<LaptopCubit, LaptopState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is LaptopLoading) {
                    return const ShimmerLoading();
                  } else if (state is LaptopSuccess) {
                    return BodywidgetSuccess(
                      listlaptop: state.lab,
                    );
                  } else if (state is LaptopFulier) {
                    return Center(child: Text(state.error));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
