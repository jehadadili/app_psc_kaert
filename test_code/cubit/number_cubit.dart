import 'package:flutter_bloc/flutter_bloc.dart';
import 'number_state.dart';

class NumberCubit extends Cubit<NumberState> {
  NumberCubit() : super(NumberInitial());
  NumberCubit get(context) => BlocProvider.of(context);
  int x = 0;
  number() {
    x++;
    emit(NumberAdd());
  }
}
