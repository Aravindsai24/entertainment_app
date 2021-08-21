import 'package:entertainment_app/models/movie.dart';
import 'package:entertainment_app/widgets/horizontal_list_ui.dart';
import 'package:flutter/material.dart';
import 'package:entertainment_app/services/fetch_movies.dart';

class bestHorror extends StatefulWidget {
  final String mainTitle;
  final String query;
  const bestHorror(
      this.mainTitle,
      this.query,
      {Key? key}) : super(key: key);

  @override
  _bestHorrorState createState() => _bestHorrorState(mainTitle,query);
}

class _bestHorrorState extends State<bestHorror> {
  late Future<List<Movie>> futureListMovies;
  final String mainTitle;
  final String query;

  _bestHorrorState(this.mainTitle,this.query): super();

  @override
  void initState() {
    super.initState();
    print("init state");
    futureListMovies = fetchMovies(query);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
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
          return CircularProgressIndicator();
        },
      ),
    );
  }
}


