import 'package:flutter_application/domain/movie/entities/movie.dart';

abstract class RecommendationMoviesState {}

class RecommendationMoviesLoading extends RecommendationMoviesState {}

class RecommendationMoviesLoaded extends RecommendationMoviesState {
  final List<MovieEntity>
      movies; // Replace dynamic with your actual movie model type
  RecommendationMoviesLoaded({required this.movies});
}

class RecommendationMoviesError extends RecommendationMoviesState {
  final String errorMessage;
  RecommendationMoviesError({required this.errorMessage});
}
