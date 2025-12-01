abstract class GenericDataState {}

class DataLoading extends GenericDataState {}

class DataLoaded<T> extends GenericDataState {
  final T data; // Replace dynamic with your actual movie model type
  DataLoaded({required this.data});
}

class FailureLoadData extends GenericDataState {
  final String errorMessage;
  FailureLoadData({required this.errorMessage});
}
