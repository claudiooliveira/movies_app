import 'package:mobx/mobx.dart';
import 'package:movies_app/models/movies_model.dart';
import 'package:movies_app/repositories/movies_repository.dart';

part 'movie_controller.g.dart';

class MovieController = _MovieController with _$MovieController;

abstract class _MovieController with Store {
  final MoviesRepository _moviesRepository;

  _MovieController(this._moviesRepository) {
    fetchMovies();
  }

  @observable
  Movies? movies;

  @observable
  bool isLoading = false;

  @action
  Future<Movies?> fetchMovies() async {
    isLoading = true;
    movies = await _moviesRepository.getMovies();
    isLoading = false;
    return movies;

  }
}
