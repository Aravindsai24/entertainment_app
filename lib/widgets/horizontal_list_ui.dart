import 'package:entertainment_app/models/movie.dart';
import 'package:flutter/material.dart';

class horizontal_list extends StatelessWidget {
  final List<Movie> movieList;
  final String mainTitle;

  const horizontal_list(
      this.mainTitle,
      this.movieList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return Container(
            height: 180.0,
            width: 100.0,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  'https://image.tmdb.org/t/p/w500'+ movieList[index].poster_path,
                ),
                Text(movieList[index].original_title)
              ],
            ),
          );
        },
      ),
    );
  }
}
