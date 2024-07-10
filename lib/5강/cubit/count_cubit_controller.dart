import 'package:bloc/bloc.dart';

class CountCubitController extends Cubit<int> {
  CountCubitController() : super(0);

  void addCount() {
    emit(state + 1);
  }

  void substractCount() {
    emit(state - 1);
  }
}
