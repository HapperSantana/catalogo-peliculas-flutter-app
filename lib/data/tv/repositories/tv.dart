import 'package:dartz/dartz.dart';
import 'package:flutter_application/common/helper/mapper/tv_mapper.dart';
import 'package:flutter_application/data/tv/models/tv.dart';
import 'package:flutter_application/data/tv/sources/tv.dart';
import 'package:flutter_application/domain/tv/repository/tv.dart';
import 'package:flutter_application/service_locator.dart';

class TvRepositoryImpl implements TvRepository {
  @override
  Future<Either> getPopularTv() async {
    var returnedData = await sl<TVService>().getPopularTv();

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }
}
