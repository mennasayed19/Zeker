import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zeker_app/features/home/data/models/books_model/books_model.dart';
import 'package:zeker_app/features/home/data/models/fatwa_model/fatwa_model.dart';
import 'package:zeker_app/features/home/data/models/khotab_model/khotab_model.dart';
import 'package:zeker_app/features/home/data/models/videos_model/videos_model.dart';
import 'package:zeker_app/features/home/data/repositories/home_repo.dart';
import 'package:quran/quran.dart' as quran;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo;

  List<String> categories = ["سور القرآن", "كتب", "خطب", "فتوه", "فيديو"];
  String selectedCategory = "سور القرآن";

  BooksModel? _booksData;
  KhotabModel? _khotabData;
  FatwaModel? _fatwaData;
  VideosModel? _videosData;
  bool _quranLoaded = false;

  void selectCategory({required String category}) async {
    if (selectedCategory == category && state is! HomeFailure) {
      // If the same category is selected again and it's not in a failure state, do nothing.
      return;
    }

    selectedCategory = category;
    emit(HomeLodaing());

    if (category == "سور القرآن") {
      if (!_quranLoaded) {
        log(quran.getPageData(1).toString());
        _quranLoaded = true;
      }
      emit(HomeQuranSuccess());
    } else if (category == "كتب") {
      if (_booksData != null) {
        emit(HomeBooksSuccess(books: _booksData!));
      } else {
        final response = await homeRepo.fetchBooksData();
        response.fold(
          (failure) => emit(HomeFailure(errorMessage: failure.errorMessage)),
          (books) {
            _booksData = books;
            emit(HomeBooksSuccess(books: books));
          },
        );
      }
    } else if (category == "خطب") {
      if (_khotabData != null) {
        emit(HomeKhotabSuccess(khotab: _khotabData!));
      } else {
        final response = await homeRepo.fetchKhotabsData();
        response.fold(
          (failure) => emit(HomeFailure(errorMessage: failure.errorMessage)),
          (khotab) {
            _khotabData = khotab;
            emit(HomeKhotabSuccess(khotab: khotab));
          },
        );
      }
    } else if (category == "فتوه") {
      if (_fatwaData != null) {
        emit(HomeFatwaSuccess(fatwa: _fatwaData!));
      } else {
        final response = await homeRepo.fetchFatwasData();
        response.fold(
          (failure) => emit(HomeFailure(errorMessage: failure.errorMessage)),
          (fatwa) {
            _fatwaData = fatwa;
            emit(HomeFatwaSuccess(fatwa: fatwa));
          },
        );
      }
    } else if (category == "فيديو") {
      if (_videosData != null) {
        emit(HomeVidoesSuccess(videoes: _videosData!));
      } else {
        final response = await homeRepo.fetchVideosData();
        response.fold(
          (failure) => emit(HomeFailure(errorMessage: failure.errorMessage)),
          (videos) {
            _videosData = videos;
            emit(HomeVidoesSuccess(videoes: videos));
          },
        );
      }
    }
  }
}
