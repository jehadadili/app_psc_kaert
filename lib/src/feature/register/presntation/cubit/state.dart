import '../../domain/model/register_modeal.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String message;
  RegisterSuccess({required this.message});
}

class RegisterError extends RegisterState {
  final RegisterModeal registerModeal;

  RegisterError({required this.registerModeal});
}

class LoginSuccess extends RegisterState {
  final String message;

  LoginSuccess({required this.message});
}

class LoginError extends RegisterState {
  final RegisterModeal registerModeal;

  LoginError({required this.registerModeal});
}

class ChoesImage extends RegisterState {}

class ChoesImageError extends RegisterState {
  final String error;

  ChoesImageError({required this.error});
}
