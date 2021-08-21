import 'dart:convert';
import 'package:entertainment_app/models/movie.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>> fetchMoviesList(String query) async{
  final response = await http.get(Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=d84ae5efcc27373a8b17dd3e1797eb1d' + query));
  if(response.statusCode == 200) {
    final body = jsonDecode(response.body);
    final results = body['results'];
    results.map((result) => jsonDecode(result));
    List<Movie> movies = [];
    var result;
    for(result in results) {
      movies.add(Movie.fromJson(result));
    }
    print(movies);
    return movies;
  } else {
    throw Exception('Failed to get popular movies');
  }
}