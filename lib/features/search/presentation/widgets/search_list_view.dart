import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeker_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:zeker_app/features/search/presentation/widgets/search_list_view_item.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoaded) {
          return ListView.builder(
            itemCount: state.searchModel.result!.length,
            itemBuilder: (context, index) {
              final result = state.searchModel.result![index];
              return SearchListViewItem(
                surahNumber: result.surah!,
                verseNumber: result.verse!,
              );
            },
          );
        } else if (state is SearchLodaing) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchFailure) {
          return Center(
            child: Text(
              state.message,
            ),
          );
        } else {
          return const Center(
            child: Text(''),
          );
        }
      },
    );
  }
}
