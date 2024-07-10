import 'package:bloc_study/6%EA%B0%95/repository/movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieCubitController extends Cubit<List<String>> {
  MovieCubitController(this.movieRepository) : super([]);
  final MovieRepository movieRepository;

  void search(String key) async {
    var result = await movieRepository.search(key);
    emit(result);
  }

//   @override
//   void onChange(Change<List<String>> change) {
//     // TODO: implement onChange
//     // print(change);
//   }
// }
}
