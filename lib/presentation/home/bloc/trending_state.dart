import 'package:flutter_application/domain/movie/entities/movie.dart';

abstract class TrendingState {}

class TrendingMoviesLoading extends TrendingState {}

class TrendingMoviesLoaded extends TrendingState {
  final List<MovieEntity>
      movies; // Replace dynamic with your actual movie model type
  TrendingMoviesLoaded({required this.movies});
}

class TrendingMoviesError extends TrendingState {
  final String errorMessage;
  TrendingMoviesError({required this.errorMessage});
}
