import 'package:flutter_application/domain/movie/usecases/get_recommendation_movies.dart';
import 'package:flutter_application/presentation/watch/bloc/recommendation_movies_state.dart';
import 'package:flutter_application/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationMoviesCubit extends Cubit<RecommendationMoviesState> {
  RecommendationMoviesCubit() : super(RecommendationMoviesLoading());

  void getRecommendationMovies(int movieId) async {
    var returnedData = await sl<GetRecommendationMoviesUseCase>().call(movieId);
    returnedData.fold((error) {
      emit(RecommendationMoviesError(errorMessage: error));
    }, (data) {
      emit(RecommendationMoviesLoaded(movies: data));
    });
  }
}
