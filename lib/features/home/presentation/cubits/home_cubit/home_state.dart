part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLodaing extends HomeState {}

class HomeFailure extends HomeState {
  final String errorMessage;

  const HomeFailure({required this.errorMessage});
}

//* Quran
class HomeQuranSuccess extends HomeState {}

//* Books
class HomeBooksSuccess extends HomeState {
  final BooksModel books;

  const HomeBooksSuccess({required this.books});
}

//* Fatwa
class HomeFatwaSuccess extends HomeState {
  final FatwaModel fatwa;

  const HomeFatwaSuccess({required this.fatwa});
}

//* khotab
class HomeKhotabSuccess extends HomeState {
  final KhotabModel khotab;

  const HomeKhotabSuccess({required this.khotab});
}

//* Videos
class HomeVidoesSuccess extends HomeState {
  final VideosModel videoes;

  const HomeVidoesSuccess({required this.videoes});
}
