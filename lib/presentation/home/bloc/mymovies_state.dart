import 'package:flutter_application/domain/movie/entities/mymovie.dart';

abstract class MyMoviesState {}

class MyMoviesLoading extends MyMoviesState {}

class MyMoviesLoaded extends MyMoviesState {
  final List<MyMovieEntity>
      movies; // Replace dynamic with your actual movie model type
  MyMoviesLoaded({required this.movies});
}

class MyMoviesError extends MyMoviesState {
  final String errorMessage;
  MyMoviesError({required this.errorMessage});
}
