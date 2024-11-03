import 'package:bloc/bloc.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class FavoriteCubit extends Cubit<List<HomeModel>> {
  FavoriteCubit() : super([]);

  addFavorite({required HomeModel homemodel}) {
    state.add(homemodel);
    emit(List.from(state));
  }

  removefROMfavority({required String id}) {
    state.removeWhere((favority) => favority.id == id);
    emit(List.from(state));
  }

  bool isFavorite(String id) {
    return state.any((favority) => favority.id == id);
  }
}
