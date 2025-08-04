part of 'fetch_salah_time_date_cubit.dart';

sealed class FetchSalahTimeDateState extends Equatable {
  const FetchSalahTimeDateState();

  @override
  List<Object> get props => [];
}

final class FetchSalahTimeDateInitial extends FetchSalahTimeDateState {}

final class FetchSalahTimeDateLoading extends FetchSalahTimeDateState {}

final class FetchSalahTimeDateFailure extends FetchSalahTimeDateState {
  final String errorMessage;

  const FetchSalahTimeDateFailure({required this.errorMessage});
}

final class FetchSalahTimeDateSuccess extends FetchSalahTimeDateState {
  final SalahTimeDate salahTimeDate;

  const FetchSalahTimeDateSuccess({required this.salahTimeDate});
}
