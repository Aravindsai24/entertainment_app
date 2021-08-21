import 'package:entertainment_app/models/movie.dart';
import 'package:entertainment_app/widgets/horizontal_list_ui.dart';
import 'package:flutter/material.dart';
import 'package:entertainment_app/services/fetch_movies_list.dart';

class bestRomance extends StatefulWidget {
  final String mainTitle;
  final String query;
  const bestRomance(
      this.mainTitle,
      this.query,
      {Key? key}) : super(key: key);

  @override
  _bestRomanceState createState() => _bestRomanceState(mainTitle,query);
}

class _bestRomanceState extends State<bestRomance> {
  late Future<List<Movie>> futureListMovies;
  final String mainTitle;
  final String query;

  _bestRomanceState(this.mainTitle,this.query): super();

  @override
  void initState() {
    super.initState();
    print("init state");
    futureListMovies = fetchMoviesList(query);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      decoration: BoxDecoration(
        border: Border.symmetric(horizontal: BorderSide(color: Colors.black,width: 4.0))
      ),
      child: FutureBuilder(
        future: futureListMovies,
        builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
          if(snapshot.hasData) {
            return horizontal_list(mainTitle,snapshot.data!);
          } else if(snapshot.hasError) {

          }
          return LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          );
        },
      ),
    );
  }
}


