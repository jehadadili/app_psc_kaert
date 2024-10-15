import '../../domain/model/register_modeal.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final RegisterModeal registerModeal;

  RegisterSuccess({required this.registerModeal});
}

class RegisterError extends RegisterState {
  final String error;

  RegisterError({required this.error});
}

class LoginSuccess extends RegisterState {
  final String message;

  LoginSuccess({required this.message});
}

class LoginError extends RegisterState{
  final RegisterModeal registerModeal;

  LoginError({required this.registerModeal});
}

class ChoesImage extends RegisterState {}

class ChoesImageError extends RegisterState {
  final String error;

  ChoesImageError({required this.error});
}
