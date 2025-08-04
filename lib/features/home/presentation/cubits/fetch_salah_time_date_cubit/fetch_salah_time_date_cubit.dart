import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zeker_app/features/home/data/models/salah_time_date/salah_time_date.dart';
import 'package:zeker_app/features/home/data/repositories/home_repo.dart';

part 'fetch_salah_time_date_state.dart';

class FetchSalahTimeDateCubit extends Cubit<FetchSalahTimeDateState> {
  FetchSalahTimeDateCubit(this.homeRepo) : super(FetchSalahTimeDateInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSalahTimeDate() async {
    emit(FetchSalahTimeDateLoading());
    var result = await homeRepo.fetchSalahTimeDate();
    // log(result.toString());
    result.fold(
      (failure) {
        emit(FetchSalahTimeDateFailure(errorMessage: failure.errorMessage));
      },
      (salahTimeDate) {
        emit(FetchSalahTimeDateSuccess(salahTimeDate: salahTimeDate));
      },
    );
  }
}
