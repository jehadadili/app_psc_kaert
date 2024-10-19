import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/src/core/di/service_locator.dart';
import 'package:market/src/core/style/color/color_app.dart';
import 'package:market/src/core/widget/custom_lodaing_home.dart';
import 'package:market/src/core/widget/custom_widget_loading.dart';
import 'package:market/src/feature/home/presntation/cubit/cubit.dart';
import 'package:market/src/feature/home/presntation/cubit/state.dart';
import 'package:market/src/feature/home/presntation/view/widgets/body_widgets_success.dart';
import 'package:market/src/feature/home/presntation/view/widgets/custom_container_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<LaptopCubit>()..laptopcubit(),
      child: Scaffold(
        backgroundColor: ColorApp.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
                pinned: true,
                expandedHeight: 140.h,
                flexibleSpace: const CustomContainerAppbar()),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Category",
                  style: TextStyle(
                      color: ColorApp.black,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
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
