import 'package:entertainment_app/models/movie.dart';
import 'package:entertainment_app/services/fetch_movie.dart';
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
              return ListView(
                children: [
                  Text(data.original_title, style: TextStyle(fontSize: 30.0)),
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
                  Text(data.overview),
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

