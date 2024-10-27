import '../../domain/model/register_modeal.dart';

abstract class AuthState {}

class RegisterInitial extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {
  final String message;
  RegisterSuccess({required this.message});
}

class RegisterError extends AuthState {
  final AuthModeal registerModeal;

  RegisterError({required this.registerModeal});
}

class LoginSuccess extends AuthState {
  final String message;

  LoginSuccess({required this.message});
}

class LoginError extends AuthState {
  final AuthModeal registerModeal;

  LoginError({required this.registerModeal});
}

class ChoesImage extends AuthState {}

class ChoesImageError extends AuthState {
  final String error;

  ChoesImageError({required this.error});
}
