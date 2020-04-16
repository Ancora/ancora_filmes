import 'dart:convert' as convert;

import 'package:ancorafilmes/movies/movie.dart';
import 'package:http/http.dart' as http;

class MoviesApi {
  static bool FAKE = false;

  static Future<List<Movie>> getMovies() async {
//    await Future.delayed(Duration(seconds: 5));

    final url =
        'https://api.themoviedb.org/3/movie/popular?api_key=d1470602405c07a6c4393c4bf9767b61&language=pt-BR';
    //print("> get: $url");

    final response = await http.get(url);
    String json = response.body;

    // Parser
    final map = convert.json.decode(json);
    //print("< json: $map");

    final mapMovies = map["results"];

    List<Movie> movies =
        mapMovies.map<Movie>((json) => Movie.fromJson(json)).toList();

    return movies;
  }
}
