import 'package:flutter_bloc/flutter_bloc.dart';
import 'azkar_counter_state.dart';
import 'package:zeker_app/features/azkar/data/models/AzkarModel.dart';

class AzkarCounterCubit extends Cubit<AzkarCounterState> {
  AzkarCounterCubit(List<AzkarModel> list)
      : super(AzkarCounterState(
            list.map((z) => int.tryParse(z.count) ?? 1).toList()));

  void decrement(int index) {
    final updated = List<int>.from(state.counters);

    if (updated[index] > 0) {
      updated[index]--;
      emit(AzkarCounterState(updated));
    }
  }
}
