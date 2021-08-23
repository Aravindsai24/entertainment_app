import 'package:entertainment_app/components/movie_view.dart';
import 'package:entertainment_app/models/movie.dart';
import 'package:entertainment_app/services/fetch_movies_list.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  List<Movie> popularSearches = [];
  List<Movie> movieList = [];
  late Future<List<Movie>> futurePopularListMovies;

  @override
  void initState() {
    super.initState();
    print("init state");
    if(popularSearches.isEmpty) {
      futurePopularListMovies = fetchMoviesList('https://api.themoviedb.org/3/movie/popular?api_key=d84ae5efcc27373a8b17dd3e1797eb1d');
      futurePopularListMovies.then((List<Movie> snapshot) => updateMovieList(snapshot));
    }
    else {
      updateMovieList(popularSearches);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        title: TextField(
          controller: _filter,
          autofocus: true,
          decoration: new InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search....'
          ),
          onChanged: updateSearchQuery,
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: movieList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  popularSearches.add(movieList[index]);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MovieView(movieList[index].id.toString())),
                  );
                },
                child: Container(
                  height: 80.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        'https://image.tmdb.org/t/p/w500'+ movieList[index].poster_path,
                        loadingBuilder: (context, child, progress) => progress == null
                            ? child
                            : LinearProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                        fit: BoxFit.contain,
                      ),
                      Text(movieList[index].original_title),
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }

  void updateSearchQuery(String value) {
    _searchText = value;
    if(_searchText != '')
      fetchMoviesList('https://api.themoviedb.org/3/search/movie?api_key=d84ae5efcc27373a8b17dd3e1797eb1d&query=$_searchText').then((value) => updateMovieList(value));
    else
      updateMovieList(popularSearches);
  }
  void updateMovieList(newMovieList) {
    if(popularSearches.isEmpty) {
      popularSearches = newMovieList;
    }
    setState(() {
      movieList = newMovieList;
    });
  }

}
