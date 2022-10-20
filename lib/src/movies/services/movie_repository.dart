import 'package:dio/dio.dart';
import 'package:flutter_cubit_movies/src/movies/model/movie_model.dart';
import 'package:flutter_cubit_movies/src/movies/services/api.dart';
import 'package:flutter_cubit_movies/src/movies/services/dio_exeptions.dart';

class MovieRepository {
  MovieRepository();

  final Dio client = Dio();

  Future<List<MovieModel>> getMovies() async {
    try {
      final url = API.URL;

      final response = await client.get(url);

      final movies = List<MovieModel>.of(
        response.data['results'].map<MovieModel>(
          (json) => MovieModel(
            title: json['title'],
            urlImage: '${API.ImageURL}${json['poster_path']}',
          ),
        ),
      );

      return movies;
    } on DioError catch (e) {
      print(e.error.toString());
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      throw errorMessage;
    } catch (e) {
      throw "bad response";
    }
  }
}
