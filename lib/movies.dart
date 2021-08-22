import 'package:entertainment_app/components/best_action.dart';
import 'package:entertainment_app/components/best_dramas.dart';
import 'package:entertainment_app/components/best_horror.dart';
import 'package:entertainment_app/components/best_romance.dart';
import 'package:entertainment_app/components/popular_movies.dart';
import 'package:flutter/material.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  String baseUrl = 'https://api.themoviedb.org/3/discover/movie?api_key=d84ae5efcc27373a8b17dd3e1797eb1d';
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Text("Popular Movies"),
        PopularMovies("Popular Movies",baseUrl+'&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1'),
        SizedBox.fromSize(size: Size.fromHeight(20.0),),
        Text("Best Dramas"),
        bestDramas("Best Dramas",baseUrl+'&language=en-&sort_by=popularity.desc&with_genres=18&include_adult=false&include_video=false&page=1'),
        SizedBox.fromSize(size: Size.fromHeight(20.0),),
        Text("Best Action"),
        bestAction("Best Action",baseUrl+'&language=en-&sort_by=popularity.desc&with_genres=28&include_adult=false&include_video=false&page=1'),
        SizedBox.fromSize(size: Size.fromHeight(20.0),),
        Text("Best Romance"),
        bestRomance("Best Romance",baseUrl+'&language=en-&sort_by=popularity.desc&with_genres=10749&include_adult=false&include_video=false&page=1'),
        SizedBox.fromSize(size: Size.fromHeight(20.0),),
        Text("Best Horror"),
        bestHorror("Best Horror",baseUrl+'&language=en-&sort_by=popularity.desc&with_genres=27&include_adult=false&include_video=false&page=1'),
      ],
    );
  }
}
