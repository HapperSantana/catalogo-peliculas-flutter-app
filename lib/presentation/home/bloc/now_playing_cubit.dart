import 'package:flutter_application/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:flutter_application/presentation/home/bloc/now_playing_state.dart';
import 'package:flutter_application/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingMoviesLoading());

  void getNowPlayingMovies() async {
    var returnedData = await sl<GetNowPlayingMoviesUseCase>().call(null);
    returnedData.fold((error) {
      emit(NowPlayingMoviesError(errorMessage: error));
    }, (data) {
      emit(NowPlayingMoviesLoaded(movies: data));
    });
  }
}
