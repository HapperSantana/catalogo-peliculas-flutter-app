import 'package:flutter_application/common/bloc/generic_data_state.dart';
import 'package:flutter_application/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenericDataCubit extends Cubit<GenericDataState> {
  GenericDataCubit() : super(DataLoading());

  void getData<T>(Usecase usecase) async {
    var returnedData = await usecase.call(null);
    returnedData.fold((error) {
      emit(FailureLoadData(errorMessage: error));
    }, (data) {
      emit(DataLoaded<T>(data: data));
    });
  }
}
