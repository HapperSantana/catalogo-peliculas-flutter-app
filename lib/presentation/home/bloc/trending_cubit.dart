import 'package:flutter_application/domain/movie/usecases/get_trending_movies.dart';
import 'package:flutter_application/presentation/home/bloc/trending_state.dart';
import 'package:flutter_application/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    var returnedData = await sl<GetTrendingMoviesUseCase>().call(null);
    returnedData.fold((error) {
      emit(TrendingMoviesError(errorMessage: error));
    }, (data) {
      emit(TrendingMoviesLoaded(movies: data));
    });
  }
}
