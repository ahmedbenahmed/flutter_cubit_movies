import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_movies/src/movies/services/movie_repository.dart';
import 'package:flutter_cubit_movies/src/movies/cubit/movie_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(InitialState()) {
    getTrendingMovies();
  }

  final MovieRepository repository = MovieRepository();

  void getTrendingMovies() async {
    try {
      emit(LoadingState());
      final movies = await repository.getMovies();
      emit(LoadedState(movies));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
