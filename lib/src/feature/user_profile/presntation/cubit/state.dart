import 'package:market/src/feature/auth/domain/model/register_modeal.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final AuthModeal authModeal;

  ProfileSuccess({required this.authModeal});
}

class ProfileFilyer extends ProfileState {
  final String mass;

  ProfileFilyer({required this.mass});
}
class UPdateProfileLoading extends ProfileState {}

class UPdateProfileSuccess extends ProfileState {
  final AuthModeal authModeal;

  UPdateProfileSuccess({required this.authModeal});
}

class UPdateProfileFilyer extends ProfileState {
  final String mass;

  UPdateProfileFilyer({required this.mass});
}
