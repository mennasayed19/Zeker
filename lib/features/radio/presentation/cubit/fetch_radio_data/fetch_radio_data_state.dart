part of 'fetch_radio_data_cubit.dart';

sealed class FetchRadioDataState extends Equatable {
  const FetchRadioDataState();

  @override
  List<Object> get props => [];
}

class FetchRadioDataInitial extends FetchRadioDataState {}

class FetchRadioDataLoading extends FetchRadioDataState {}

class FetchRadioDataSuccess extends FetchRadioDataState {
  final RadioModel radio;

  const FetchRadioDataSuccess({required this.radio});
}

class FetchRadioDataFailure extends FetchRadioDataState {
  final String errorMessage;

  const FetchRadioDataFailure({required this.errorMessage});
}
