import 'package:movies_app/models/movies_model.dart';
import 'package:movies_app/repositories/movies_repository.dart';
import 'package:movies_app/service/dio_service.dart';
import 'package:movies_app/utils/api_utils.dart';

class MoviesRepositoryImplementation implements MoviesRepository {
  final DioService _dioService;

  MoviesRepositoryImplementation(this._dioService);

  @override
  Future <Movies> getMovies() async {
    final response = await _dioService.getDio().get(Api.requestMovieList);
    final body = response.data as Map<String, dynamic>;
    final movies = Movies.fromJson(body);
    return movies;
  }
}
