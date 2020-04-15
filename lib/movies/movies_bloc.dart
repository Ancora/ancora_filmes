import 'package:ancorafilmes/movies/movie.dart';
import 'package:ancorafilmes/movies/movie_api.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _moviesController = BehaviorSubject<List<Movie>>();
  get stream => _moviesController.stream;

  Future fetch({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        _moviesController.sink.add(null);
      }
      final movies = await MoviesApi.getMovies();
      _moviesController.sink.add(movies);
      return movies;
    } catch (error) {
      _moviesController.addError('Nenhum filme!');
    }
  }

  void dispose() {
    _moviesController.close();
  }
}
