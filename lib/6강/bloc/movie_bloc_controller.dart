import 'package:bloc_study/6%EA%B0%95/repository/movie_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class MovieBlocController extends Bloc<MovieEvent, List<String>> {
  final MovieRepository _movieRepository;
  MovieBlocController(this._movieRepository)
      : super(_movieRepository.searchPreview) {
    on<SearchMovieEvent>(
      (event, emit) async {
        var result = await _movieRepository.search(event.key);
        emit(result);
      },
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 700))
          .flatMap(mapper),
    );
  }

  @override
  void onTransition(Transition<MovieEvent, List<String>> transition) {
    super.onTransition(transition);
    // ignore: avoid_print
    print(transition);
  }
}

abstract class MovieEvent extends Equatable {}

class SearchMovieEvent extends MovieEvent {
  final String key;
  SearchMovieEvent(this.key);
  @override
  List<Object?> get props => [];
}
