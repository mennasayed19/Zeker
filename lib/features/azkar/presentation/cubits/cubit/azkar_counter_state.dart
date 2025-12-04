import 'package:equatable/equatable.dart';

class AzkarCounterState extends Equatable {
  final List<int> counters;

  const AzkarCounterState(this.counters);

  @override
  List<Object?> get props => [counters];
}
