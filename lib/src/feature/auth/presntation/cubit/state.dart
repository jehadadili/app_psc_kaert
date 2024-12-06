import '../../domain/model/register_modeal.dart';

abstract class AuthState {}

class RegisterInitial extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {
  final AuthModeal authModeal;
  RegisterSuccess({required this.authModeal});
}

class RegisterError extends AuthState {
  final String mass;

  RegisterError({required this.mass});
}

class LoginSuccess extends AuthState {
  final AuthModeal authModeal;

  LoginSuccess({required this.authModeal});
}

class LoginError extends AuthState {
  final String message;

  LoginError({required this.message});
}

class ChoesImage extends AuthState {}

class ChoesImageError extends AuthState {
  final String error;

  ChoesImageError({required this.error});
}
