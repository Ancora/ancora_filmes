import 'package:ancorafilmes/movies/movie_api.dart';
import 'package:ancorafilmes/utils/simple_bloc.dart';

class MoviesBloc extends SimpleBloc {
  Future fetch({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        add(null);
      }
      final movies = await MoviesApi.getMovies();
      add(movies);
      //print('movies_bloc===> $movies');
      return movies;
    } catch (error) {
      addError('Nenhum filme!');
    }
  }
}
