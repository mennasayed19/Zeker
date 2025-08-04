part of 'radio_cubit.dart';

abstract class RadioState extends Equatable {
  const RadioState();

  @override
  List<Object> get props => [];
}

class RadioInitial extends RadioState {}

class RadioPaused extends RadioState {}

class RadioPlaying extends RadioState {}

class RadioStopped extends RadioState {}
