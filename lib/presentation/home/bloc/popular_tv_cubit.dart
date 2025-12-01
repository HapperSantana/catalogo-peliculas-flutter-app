import 'package:flutter_application/domain/tv/usecases/get_popular_tv.dart';
import 'package:flutter_application/presentation/home/bloc/popular_tv_state.dart';
import 'package:flutter_application/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularTVCubit extends Cubit<PopularTVState> {
  PopularTVCubit() : super(PopularTVLoading());

  void getPopularTV() async {
    var returnedData = await sl<GetPopularTVUseCase>().call(null);
    returnedData.fold((error) {
      emit(PopularTVError(errorMessage: error));
    }, (data) {
      emit(PopularTVLoaded(tv: data));
    });
  }
}
