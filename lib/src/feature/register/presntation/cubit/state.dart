import '../../domain/model/register_modeal.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoding extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final RegisterModeal registerModeal;

  RegisterSuccess({required this.registerModeal});
}

class RegisterError extends RegisterState {
  final String error;

  RegisterError({required this.error});
}

class ChoesImage extends RegisterState{}
class ChoesImageError extends RegisterState{
   final String error;

  ChoesImageError({required this.error});
}