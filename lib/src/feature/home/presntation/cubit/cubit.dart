import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/src/feature/home/domain/use_case/use_case.dart';
import 'package:market/src/feature/home/presntation/cubit/state.dart';

class LabtopCubit extends Cubit<LabtopState> {
  LabtopCubit get(context) => BlocProvider.of(context);
  final LabtopUseCase labtopUseCasehome;
  LabtopCubit({required this.labtopUseCasehome}) : super(LabtopInitial());
  labtopCubit() {
    emit(LabtopLoading());
    var product = labtopUseCasehome.labtopUseCase();
    product.then(
      (value) {
        log("======================================");
        log(value.toString());
        value.fold((fulier) {
          log("احنا واقفين في ال cubit");
          emit(LabtopFulier(error: fulier.toString()));
        }, (success) {
          log("احنا واقفين في ال cubit");
          emit(LabtopSuccess(lab: success));
        });
      },
    );
  }
}
