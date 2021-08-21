class Movie {
  final int id;
  final String poster_path;
  final String original_title;
  final String original_language;
  final String overview;
  final String release_date;
  String? trailer_id;

  Movie({
    required this.id,
    required this.poster_path,
    required this.original_title,
    required this.original_language,
    required this.overview,
    required this.release_date,
});

  @override
  String toString() {
    return '{ '
        'id: $id, '
        'poster_path: $poster_path, '
        'original_title: $original_title, '
        'original_language: $original_language, '
        'overview: $overview, '
        'release_date: $release_date, '
        '}';
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['id'],
        poster_path: json['poster_path'],
        original_title: json['original_title'],
        original_language: json['original_language'],
        overview: json['overview'],
        release_date: json['release_date']
    );
  }

}