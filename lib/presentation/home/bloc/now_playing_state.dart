import 'package:flutter_application/domain/movie/entities/movie.dart';

abstract class NowPlayingState {}

class NowPlayingMoviesLoading extends NowPlayingState {}

class NowPlayingMoviesLoaded extends NowPlayingState {
  final List<MovieEntity>
      movies; // Replace dynamic with your actual movie model type
  NowPlayingMoviesLoaded({required this.movies});
}

class NowPlayingMoviesError extends NowPlayingState {
  final String errorMessage;
  NowPlayingMoviesError({required this.errorMessage});
}
