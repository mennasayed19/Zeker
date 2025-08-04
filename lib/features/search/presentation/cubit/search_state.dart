// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLodaing extends SearchState {}

class SearchLoaded extends SearchState {
  final SearchModel searchModel;
  final bool isPlaying;

  const SearchLoaded({
    required this.searchModel,
    this.isPlaying = false,
  });

  SearchLoaded copyWith({
    SearchModel? searchModel,
    bool? isPlaying,
  }) {
    return SearchLoaded(
      searchModel: searchModel ?? this.searchModel,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }

  @override
  List<Object> get props => [searchModel, isPlaying];
}

class SearchFailure extends SearchState {
  final String message;

  const SearchFailure({required this.message});

  @override
  List<Object> get props => [message];
}
