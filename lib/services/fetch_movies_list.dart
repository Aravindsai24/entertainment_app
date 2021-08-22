import 'dart:convert';
import 'package:entertainment_app/models/movie.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>> fetchMoviesList(String query) async{
  final response = await http.get(Uri.parse(query));
  if(response.statusCode == 200) {
    print("inside fetch movies list");
    final body = jsonDecode(response.body);
    final results = body['results'];
    List<Movie> movies = [];
    if(results != null) {
      results.map((result) => jsonDecode(result));
      var result;
      for(result in results) {
        movies.add(Movie.fromJson(result));
      }
    }
    print(movies);
    return movies;
  } else {
    throw Exception('Failed to get popular movies');
  }
}