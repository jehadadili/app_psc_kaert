import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/src/feature/user_profile/domain/use_cass/use_cass.dart';
import 'package:market/src/feature/user_profile/domain/use_cass/use_cass_ubdate_profile.dart';
import 'package:market/src/feature/user_profile/presntation/cubit/state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit get(context) => BlocProvider.of(context);
  final UseCassprofile useCassprofile;
  final UseCassUbdateProfile useCassUbdateProfile;
  bool edit = true;
  ProfileCubit({
    required this.useCassprofile,
    required this.useCassUbdateProfile,
  }) : super(ProfileInitial());

  profiledate() async {
    emit(ProfileLoading());
    try {
      var respone = useCassprofile.profileusecass();
      respone.then((value) {
        emit(ProfileSuccess(authModeal: value));
      });
    } catch (e) {
      emit(ProfileFilyer(mass: e.toString()));
    }
  }

  ubdateProfile({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(UPdateProfileLoading());

    try {
      var ubdate = await useCassUbdateProfile.useUbdateProfile(
          name: name, email: email, phone: phone, password: password);

      emit(UPdateProfileSuccess(authModeal: ubdate));
      profiledate();
    } catch (e) {
      emit(UPdateProfileFilyer(mass: e.toString()));
    }
  }

  // editprofile() {
  //   edit != edit;
  //   emit(SuccessEdit());
  // }
}
