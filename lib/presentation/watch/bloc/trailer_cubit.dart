import 'package:flutter_application/core/entity/trailer.dart';
import 'package:flutter_application/domain/movie/usecases/get_movie_trailer.dart';
import 'package:flutter_application/presentation/watch/bloc/trailer_state.dart';
import 'package:flutter_application/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getMovieTrailer(int movieId) async {
    var returnedData = await sl<GetMovieTrailerUseCase>().call(movieId);

    returnedData.fold((error) {
      emit(TrailerError(errorMessage: error));
    }, (data) async {
      TrailerEntity trailerEntity = data;
      YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: trailerEntity.key!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ),
      );

      emit(TrailerLoaded(youtubePlayerController: controller));
    });
  }
}
