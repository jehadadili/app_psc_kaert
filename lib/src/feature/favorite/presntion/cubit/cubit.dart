import 'package:bloc/bloc.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class FovoriteCubit extends Cubit<List<HomeModel>> {
  FovoriteCubit() : super([]);
  addFavorite({required HomeModel homemodel}) {
    state.add(homemodel);
    emit(List.from(state));
  }
}
