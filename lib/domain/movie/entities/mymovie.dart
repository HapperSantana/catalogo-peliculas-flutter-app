class MyMovieEntity {
  final String? id;
  final String title;
  final int year;
  final String director;
  final String genre;
  final String synopsis;
  final String posterUrl;

  MyMovieEntity({
    this.id,
    required this.title,
    required this.year,
    required this.director,
    required this.genre,
    required this.synopsis,
    required this.posterUrl,
  });
}
