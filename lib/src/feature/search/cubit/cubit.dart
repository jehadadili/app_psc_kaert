import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';

class SearchCubit extends Cubit<List<HomeModel>> {
  SearchCubit() : super([]);

  void searchProduct({required String name}) {
    List<HomeModel> filteredProducts = state.where((element) {
      return element.name.toLowerCase().contains(name.toLowerCase());
    }).toList();

    emit(filteredProducts);
  }
}
