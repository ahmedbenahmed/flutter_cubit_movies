import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_movies/src/movies/cubit/movie_cubit.dart';
import 'package:flutter_cubit_movies/src/movies/screens/movie_page.dart';
import 'package:flutter_cubit_movies/src/movies/services/movie_repository.dart';

void main() {
  runApp(MyApp());
}

// 2
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<MoviesCubit>(
        create: (context) => MoviesCubit(),
        child: MoviesPage(),
      ),
    );
  }
}
