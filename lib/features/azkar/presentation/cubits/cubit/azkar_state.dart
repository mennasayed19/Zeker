import 'package:equatable/equatable.dart';
import 'package:zeker_app/features/azkar/data/models/AzkarModel.dart';

sealed class AzkarState extends Equatable {
  const AzkarState();

  @override
  List<Object> get props => [];
}

final class AzkarInitial extends AzkarState {}

final class AzkarLoading extends AzkarState {}

final class AzkarSucces extends AzkarState {
  final List<AzkarModel> azkarList;
  const AzkarSucces(this.azkarList);
  @override
  List<Object> get props => [azkarList];
}

final class AzkarError extends AzkarState {
  final String message;
  const AzkarError(this.message);
  @override
  List<Object> get props => [message];
}
