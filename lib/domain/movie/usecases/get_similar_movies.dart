import 'package:dartz/dartz.dart';
import 'package:flutter_application/core/usecase/usecase.dart';
import 'package:flutter_application/domain/movie/repositories/movie.dart';
import 'package:flutter_application/service_locator.dart';

class GetSimilarMoviesUseCase extends Usecase<Either, int> {
  @override
  Future<Either> call(int params) async {
    return await sl<MovieRepository>().getSimilarMovies(params);
  }
}
