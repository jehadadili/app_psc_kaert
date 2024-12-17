import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/src/feature/user_profile/domain/use_cass/use_cass.dart';
import 'package:market/src/feature/user_profile/domain/use_cass/use_cass_ubdate_profile.dart';
import 'package:market/src/feature/user_profile/presntation/cubit/state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  static ProfileCubit get(context) => BlocProvider.of<ProfileCubit>(context);

  final UseCassprofile useCassprofile;
  final UseCassUbdateProfile useCassUbdateProfile;

  bool editName = true;
  bool editEmail = true;
  bool editPhone = true;

  ProfileCubit({
    required this.useCassprofile,
    required this.useCassUbdateProfile,
  }) : super(ProfileInitial());

  /// استدعاء بيانات الملف الشخصي
  Future<void> profiledate() async {
    emit(ProfileLoading());
    try {
      var response = await useCassprofile.profileusecass();
      emit(ProfileSuccess(authModeal: response));
    } catch (e) {
      emit(ProfileFilyer(mass: e.toString()));
    }
  }

  /// تحديث بيانات الملف الشخصي
  Future<void> ubdateProfile({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(UPdateProfileLoading());
    try {
      var update = await useCassUbdateProfile.useUbdateProfile(
        name: name,
        email: email,
        phone: phone,
        password: password,
      );
      emit(UPdateProfileSuccess(authModeal: update));
      await profiledate();
    } catch (e) {
      emit(UPdateProfileFilyer(mass: e.toString()));
    }
  }

  /// تبديل حالة التعديل لكل حقل
  void toggleEditName() {
    editName = !editName;
    emit(SuccessEdit());
    profiledate();
  }

  void toggleEditEmail() {
    editEmail = !editEmail;
    emit(SuccessEdit());
    profiledate();
  }

  void toggleEditPhone() {
    editPhone = !editPhone;
    emit(SuccessEdit());
    profiledate();
  }
}
