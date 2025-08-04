import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeker_app/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:zeker_app/features/home/presentation/widgets/custom_quran_sliver_list.dart';
import 'package:zeker_app/features/home/presentation/widgets/data_list_view_item.dart';

class DataListView extends StatelessWidget {
  const DataListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLodaing) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is HomeFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  state.errorMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ),
          );
        } else if (state is HomeBooksSuccess) {
          return _buildSliverList(
            state.books.data!,
            (index) => DataListViewItem(
              title: state.books.data![index].title ?? "No Title",
              url: _getAttachmentUrl(state.books.data![index].attachments),
              description:
                  state.books.data![index].description ?? "No Description",
              preparedBy: _getPreparedBy(state.books.data![index].preparedBy),
            ),
          );
        } else if (state is HomeKhotabSuccess) {
          return _buildSliverList(
            state.khotab.data!,
            (index) => DataListViewItem(
              title: state.khotab.data![index].title ?? "No Title",
              url: _getAttachmentUrl(state.khotab.data![index].attachments),
              description:
                  state.khotab.data![index].description ?? "No Description",
              preparedBy: _getPreparedBy(state.khotab.data![index].preparedBy),
            ),
          );
        } else if (state is HomeFatwaSuccess) {
          return _buildSliverList(
            state.fatwa.data!,
            (index) => DataListViewItem(
              title: state.fatwa.data![index].title ?? "No Title",
              url: _getAttachmentUrl(state.fatwa.data![0].attachments),
              description:
                  state.fatwa.data![index].description ?? "No Description",
              preparedBy: _getPreparedBy(state.fatwa.data![index].preparedBy),
            ),
          );
        } else if (state is HomeVidoesSuccess) {
          return _buildSliverList(
            state.videoes.data!,
            (index) => DataListViewItem(
              title: state.videoes.data![index].title ?? "No Title",
              url: _getAttachmentUrl(state.videoes.data![index].attachments),
              description:
                  state.videoes.data![index].description ?? "No Description",
              preparedBy: _getPreparedBy(state.videoes.data![index].preparedBy),
            ),
          );
        } else {
          return const CustomQuranSliverList();
        }
      },
    );
  }

  /// **Helper Function to Build SliverList**
  Widget _buildSliverList<T>(
      List<T> dataList, Widget Function(int) itemBuilder) {
    if (dataList.isEmpty) {
      return const SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("No Data Available", textAlign: TextAlign.center),
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: itemBuilder(index),
        ),
        childCount: dataList.length,
      ),
    );
  }

  /// **Helper function to safely get attachment URL**
  String _getAttachmentUrl(List<dynamic>? attachments) {
    return (attachments != null && attachments.isNotEmpty)
        ? attachments.first.url ?? ''
        : '';
  }

  /// **Helper function to safely get prepared by information**
  String _getPreparedBy(List<dynamic>? preparedBy) {
    return (preparedBy != null && preparedBy.isNotEmpty)
        ? preparedBy.first.title ?? "No Author"
        : "No Author";
  }
}
