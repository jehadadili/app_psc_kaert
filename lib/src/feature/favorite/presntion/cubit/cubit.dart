import 'package:bloc/bloc.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class FavoriteCubit extends Cubit<List<HomeModel>> {
  FavoriteCubit() : super([]);

  // إضافة العنصر إلى المفضلة
  addFavorite({required HomeModel homemodel}) {
    state.add(homemodel);
    emit(List.from(state));
  }

  // إزالة العنصر من المفضلة
  removefROMfavority({required String id}) {
    state.removeWhere((favority) => favority.id == id);
    emit(List.from(state));
  }

  // التحقق إذا كان العنصر موجودًا في المفضلة
  bool isFavorite(String id) {
    return state.any((favority) => favority.id == id);
  }
}
