import 'package:entertainment_app/components/movie_view.dart';
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
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MovieView(movieList[index].id.toString())),
              );
            },
            child: Container(
              height: 180.0,
              width: 120.0,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500'+ movieList[index].poster_path,
                loadingBuilder: (context, child, progress) => progress == null
                    ? child
                    : LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }
}
