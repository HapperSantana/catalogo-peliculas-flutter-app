import 'package:flutter_application/data/movie/models/movie.dart';
import 'package:flutter_application/domain/movie/entities/movie.dart';

class MovieMapper {
  static MovieEntity toEntity(MovieModel movie) {
    return MovieEntity(
      backdropPath: movie.backdropPath,
      id: movie.id,
      title: movie.title,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: movie.posterPath,
      mediaType: movie.mediaType,
      adult: movie.adult,
      originalLanguage: movie.originalLanguage,
      genreIds: movie.genreIds,
      releaseDate: movie.releaseDate,
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount,
    );
  }
}
