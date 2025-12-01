import 'package:flutter_application/domain/tv/entities/tv.dart';

abstract class PopularTVState {}

class PopularTVLoading extends PopularTVState {}

class PopularTVLoaded extends PopularTVState {
  final List<TVEntity> tv; // Replace dynamic with your actual movie model type
  PopularTVLoaded({required this.tv});
}

class PopularTVError extends PopularTVState {
  final String errorMessage;
  PopularTVError({required this.errorMessage});
}
