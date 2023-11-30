import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasource/movie_datasource.dart';
import 'package:cinemapedia/domain/entitiy/movie.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MovieDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'tr-MX',
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final List<Movie> movies = [];
    return movies;
  }
}
