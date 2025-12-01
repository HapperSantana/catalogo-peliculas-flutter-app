import 'package:flutter_application/data/movie/models/mymovie.dart';
import 'package:flutter_application/domain/movie/entities/mymovie.dart';

class MyMovieMapper {
  static MyMovieEntity toEntity(MyMovieModel mymovie) {
    return MyMovieEntity(
        title: mymovie.title,
        year: mymovie.year,
        director: mymovie.director,
        genre: mymovie.genre,
        synopsis: mymovie.synopsis,
        posterUrl: mymovie.posterUrl);
  }
}
