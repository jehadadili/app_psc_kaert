import 'package:bloc/bloc.dart';
import 'package:market/src/feature/profile/domain/use_cass/use_cass.dart';
import 'package:market/src/feature/profile/presntation/cubit/state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final UseCassprofile useCassprofile;
  ProfileCubit({required this.useCassprofile}) : super(ProfileInitial());

  profiledata() async {
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
}
