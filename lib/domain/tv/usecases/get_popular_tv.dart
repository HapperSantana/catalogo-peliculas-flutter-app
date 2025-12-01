import 'package:dartz/dartz.dart';
import 'package:flutter_application/core/usecase/usecase.dart';
import 'package:flutter_application/domain/tv/repository/tv.dart';
import 'package:flutter_application/service_locator.dart';

class GetPopularTVUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call(params) async {
    return await sl<TvRepository>().getPopularTv();
  }
}
