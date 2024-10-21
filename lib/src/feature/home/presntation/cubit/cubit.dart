import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/src/feature/home/domain/use_case/use_case.dart';
import 'package:market/src/feature/home/presntation/cubit/state.dart';

class LaptopCubit extends Cubit<LaptopState> {
  final LaptopUseCase laptopUseCasehome;
  static LaptopCubit get(context) => BlocProvider.of(context);

  LaptopCubit({required this.laptopUseCasehome}) : super(LaptopInitial());

  void fetchLaptops() async {
    emit(LaptopLoading());

    var product = await laptopUseCasehome.laptopuseCase();

    product.fold(
      (failure) {
        log("Error in Cubit: ${failure.errormasseig}");
        emit(LaptopFulier(error: failure.errormasseig ?? "Unknown error"));
      },
      (success) {
        log("Data fetched successfully in Cubit");
        emit(LaptopSuccess(lab: success));
      },
    );
  }

  bool iconfav = true;
  String idstate = "";
  changeColor({required String id}) {
    iconfav = false;
    idstate = id;
    fetchLaptops();
    emit(ChangeColor());
    emit(LaptopLoading());
  }
}
