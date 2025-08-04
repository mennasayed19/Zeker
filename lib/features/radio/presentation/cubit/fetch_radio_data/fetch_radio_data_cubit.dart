import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zeker_app/features/radio/data/models/radio_model/radio_model.dart';
import 'package:zeker_app/features/radio/data/repositories/radio_repo.dart';

part 'fetch_radio_data_state.dart';

class FetchRadioDataCubit extends Cubit<FetchRadioDataState> {
  FetchRadioDataCubit(this.radioRepo) : super(FetchRadioDataInitial());

  final RadioRepo radioRepo;

  Future<void> fetchRadioData() async {
    emit(FetchRadioDataLoading());
    var result = await radioRepo.fetchRadioData();
    result.fold(
      (failure) {
        emit(FetchRadioDataFailure(errorMessage: failure.errorMessage));
      },
      (radio) {
        emit(FetchRadioDataSuccess(radio: radio));
      },
    );
  }
}
