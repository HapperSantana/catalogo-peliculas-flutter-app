import 'package:flutter_application/domain/movie/usecases/get_similar_movies.dart';
import 'package:flutter_application/presentation/watch/bloc/similar_movies_state.dart';
import 'package:flutter_application/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimiliarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimiliarMoviesCubit() : super(SimilarMoviesLoading());

  void getSimilarMovies(int movieId) async {
    var returnedData = await sl<GetSimilarMoviesUseCase>().call(movieId);
    returnedData.fold((error) {
      emit(SimilarMoviesError(errorMessage: error));
    }, (data) {
      emit(SimilarMoviesLoaded(movies: data));
    });
  }
}
