import 'package:market/src/feature/home/domain/model/home_model.dart';

abstract class LaptopState {}

class LaptopInitial extends LaptopState {}

class LaptopLoading extends LaptopState {}

class LaptopSuccess extends LaptopState {
  final List<HomeModel> lab;

  LaptopSuccess({required this.lab});
}

class LaptopFulier extends LaptopState {
  final String error;

  LaptopFulier({required this.error});
}
