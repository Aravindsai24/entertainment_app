import 'dart:convert';
import 'package:entertainment_app/models/movie.dart';
import 'package:http/http.dart' as http;

Future<Movie> fetchMovie(String movieId) async{

  final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/${movieId}?api_key=d84ae5efcc27373a8b17dd3e1797eb1d'));
  if(response.statusCode == 200) {
    final body = jsonDecode(response.body);
    Movie movie = Movie.fromJson(body);
    var genres = <String>[];
    for(var genre in body['genres']) {
      genres.add(genre['name']);
    }
    movie.tagline = body['tagline'];
    movie.genres = genres;
    print(movie);
    print("#############");
    return movie;
  } else {
    throw Exception('Failed to get movie details');
  }
}