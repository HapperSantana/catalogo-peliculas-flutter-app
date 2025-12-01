import 'package:flutter_application/domain/movie/entities/movie.dart';

abstract class SimilarMoviesState {}

class SimilarMoviesLoading extends SimilarMoviesState {}

class SimilarMoviesLoaded extends SimilarMoviesState {
  final List<MovieEntity>
      movies; // Replace dynamic with your actual movie model type
  SimilarMoviesLoaded({required this.movies});
}

class SimilarMoviesError extends SimilarMoviesState {
  final String errorMessage;
  SimilarMoviesError({required this.errorMessage});
}
