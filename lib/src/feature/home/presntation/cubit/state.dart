import 'package:market/src/feature/home/domain/model/home_model.dart';

abstract class LabtopState {}

class LabtopInitial extends LabtopState {}

class LabtopLoading extends LabtopState {}

class LabtopSuccess extends LabtopState {
  final List<HomeModel> lab;

  LabtopSuccess({required this.lab});
}

class LabtopFulier extends LabtopState {
  final String error;

  LabtopFulier({required this.error});
}
