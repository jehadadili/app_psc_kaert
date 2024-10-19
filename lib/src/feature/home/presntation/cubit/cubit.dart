import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/src/feature/home/domain/use_case/use_case.dart';
import 'package:market/src/feature/home/presntation/cubit/state.dart';

class LaptopCubit extends Cubit<LaptopState> {
  LaptopCubit get(context) => BlocProvider.of(context);
  final LaptopUseCase laptopUseCasehome;
  LaptopCubit({required this.laptopUseCasehome}) : super(LaptopInitial());
  laptopcubit() {
    emit(LaptopLoading());
    var product = laptopUseCasehome.laptopuseCase();
    product.then(
      (value) {
        log("======================================");
        log(value.toString());
        value.fold((fulier) {
          log("احنا واقفين في ال cubit");
          log(fulier.toString());
          emit(LaptopFulier(error: fulier.toString()));
        }, (success) {
          log("احنا واقفين في ال cubit");
          emit(LaptopSuccess(lab: success));
        });
      },
    );
  }
}
