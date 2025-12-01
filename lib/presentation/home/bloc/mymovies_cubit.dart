import 'package:flutter_application/domain/movie/usecases/get_all_my_movies.dart';
import 'package:flutter_application/presentation/home/bloc/mymovies_state.dart';
import 'package:flutter_application/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyMoviesCubit extends Cubit<MyMoviesState> {
  MyMoviesCubit() : super(MyMoviesLoading());

  void getAllMyMovies() async {
    var returnedData = await sl<GetAllMyMoviesUseCase>().call(null);
    returnedData.fold((error) {
      emit(MyMoviesError(errorMessage: error));
    }, (data) {
      emit(MyMoviesLoaded(movies: data));
    });
  }
}
