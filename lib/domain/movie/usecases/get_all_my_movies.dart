import 'package:dartz/dartz.dart';
import 'package:flutter_application/core/usecase/usecase.dart';
import 'package:flutter_application/domain/movie/repositories/movie.dart';
import 'package:flutter_application/service_locator.dart';

class GetAllMyMoviesUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call(params) async {
    return await sl<MovieRepository>().getAllMyMovies();
  }
}
