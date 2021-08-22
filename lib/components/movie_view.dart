import 'package:entertainment_app/models/movie.dart';
import 'package:entertainment_app/services/fetch_movie.dart';
import 'package:entertainment_app/services/fetch_movies_list.dart';
import 'package:entertainment_app/widgets/horizontal_list_ui.dart';
import 'package:flutter/material.dart';

class MovieView extends StatefulWidget {
  final String movieId;
  const MovieView(
      this.movieId,
      {Key? key}) : super(key: key);

  @override
  _MovieViewState createState() => _MovieViewState(movieId);
}

class _MovieViewState extends State<MovieView> {
  final String movieId;
  late Future<Movie> movie;
  late String movieUrl;

  _MovieViewState(this.movieId): super();

  @override
  void initState() {
    movie = fetchMovie(movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entertainment App'),
      ),
      body: FutureBuilder(
          future: movie,
          builder: (context, AsyncSnapshot<Movie> snapshot) {
            if(snapshot.hasData) {
              var data = snapshot.data!;
              String movieUrl = 'https://api.themoviedb.org/3/movie/${data.id}/similar?api_key=d84ae5efcc27373a8b17dd3e1797eb1d';
              Future<List<Movie>> similarMovies = fetchMoviesList(movieUrl);
              return ListView(
                children: [
                  Text(data.original_title, style: TextStyle(fontSize: 30.0)),
                  Text( data.tagline.toString(),
                      style: TextStyle(fontStyle: FontStyle.italic,fontSize: 12.0)),
                  SizedBox(height: 10.0,),
                  Image.network(
                    'https://image.tmdb.org/t/p/w500'+ data.poster_path,
                    loadingBuilder: (context, child, progress) => progress == null
                        ? child
                        : LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                    height: 240.0,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(height: 10.0,),
                  Text(data.overview),
                  SizedBox(height: 10.0,),
                  Text("Genres: "+data.genres!.join(','), style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 10.0,),
                  Text("Similar Movies", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.0)),
                  Container(
                    height: 180.0,
                    decoration: BoxDecoration(
                        border: Border.symmetric(horizontal: BorderSide(color: Colors.black,width: 4.0))
                    ),
                    child: FutureBuilder(
                        future: similarMovies,
                        builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
                          if(snapshot.hasData) {
                            return horizontal_list('Similar Movies',snapshot.data!);
                          } else if(snapshot.hasError) {

                          }
                          return LinearProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                          );
                        }
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {

            }
            return LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            );
            },
      ),
    );
  }
}

