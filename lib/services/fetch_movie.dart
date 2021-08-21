import 'dart:convert';
import 'package:entertainment_app/models/movie.dart';
import 'package:http/http.dart' as http;

Future<Movie> fetchMovie(String movieId) async{

  final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/${movieId}?api_key=d84ae5efcc27373a8b17dd3e1797eb1d&append_to_response=videos'));
  if(response.statusCode == 200) {
    final body = jsonDecode(response.body);
    Movie movie = Movie.fromJson(body);
    final videos = body['videos'];
    final videoResults = videos['results'];
    movie.trailer_id = videoResults[0]['key'];
    print(movie);
    return movie;
  } else {
    throw Exception('Failed to get popular movies');
  }
}