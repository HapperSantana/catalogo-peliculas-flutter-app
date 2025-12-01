import 'package:dartz/dartz.dart';
import 'package:flutter_application/common/helper/mapper/movie_mapper.dart';
import 'package:flutter_application/common/helper/mapper/mymovie_mapper.dart';
import 'package:flutter_application/common/helper/mapper/trailer_mapper.dart';
import 'package:flutter_application/core/models/trailer.dart';
import 'package:flutter_application/data/movie/models/movie.dart';
import 'package:flutter_application/data/movie/models/mymovie.dart';
import 'package:flutter_application/data/movie/sources/movie.dart';
import 'package:flutter_application/domain/movie/repositories/movie.dart';
import 'package:flutter_application/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnedData = await sl<MovieService>().getTrendingMovies();

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    var returnedData = await sl<MovieService>().getNowPlayingMovies();

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    var returnedData = await sl<MovieService>().getMovieTrailer(movieId);

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      //print(data);
      var movies =
          TrailerMapper.toEntity(TrailerModel.fromJson(data['trailer']));
      //print(movies);
      return Right(movies);
    });
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    var returnedData =
        await sl<MovieService>().getRecommendationMovies(movieId);

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async {
    var returnedData = await sl<MovieService>().getSimilarMovies(movieId);

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getAllMyMovies() async {
    var returnedData = await sl<MovieService>().getAllMyMovies();

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data)
          .map((item) => MyMovieMapper.toEntity(MyMovieModel.fromDoc(item)))
          .toList();
      return Right(movies);
    });
  }
}
