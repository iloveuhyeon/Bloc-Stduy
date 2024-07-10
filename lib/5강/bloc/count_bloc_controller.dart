import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class CountBlocController extends Bloc<CountEvent, int> {
  CountBlocController() : super(0) {
    on<AddCountEvent>(
      (event, emit) => emit(state + 1),
    );
    on<SubstractCountEvent>(
      (event, emit) => emit(state - 1),
    );
  }
}

abstract class CountEvent extends Equatable {}

class AddCountEvent extends CountEvent {
  @override
  List<Object?> get props => [];
}

class SubstractCountEvent extends CountEvent {
  @override
  List<Object?> get props => [];
}
