import 'package:equatable/equatable.dart';
import 'package:flutter_cubit_movies/src/movies/model/movie_model.dart';

abstract class MoviesState extends Equatable {}

class InitialState extends MoviesState {
  @override
  List<Object> get props => [];
}

class LoadingState extends MoviesState {
  @override
  List<Object> get props => [];
}

class LoadedState extends MoviesState {
  LoadedState(this.movies);

  final List<MovieModel> movies;

  @override
  List<Object> get props => [movies];
}

class ErrorState extends MoviesState {
  final String msg;

  ErrorState(this.msg);

  @override
  List<Object> get props => [];
}
