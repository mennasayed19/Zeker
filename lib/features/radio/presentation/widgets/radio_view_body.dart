import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeker_app/features/radio/presentation/cubit/fetch_radio_data/fetch_radio_data_cubit.dart';
import 'package:zeker_app/features/radio/presentation/widgets/radio_list_view_item.dart';

class RadioViewBody extends StatelessWidget {
  const RadioViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchRadioDataCubit, FetchRadioDataState>(
      builder: (context, state) {
        if (state is FetchRadioDataLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FetchRadioDataFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is FetchRadioDataSuccess) {
          return ListView.builder(
            itemCount: state.radio.radios!.length,
            itemBuilder: (context, index) {
              return RadioListViewItem(
                title: state.radio.radios![index].name ?? "No Title",
                url: state.radio.radios![index].url ?? "No Url",
                id: state.radio.radios![index].id ?? 0,
              );
            },
          );
        } else {
          return const Center(
            child: Text('Error'),
          );
        }
      },
    );
  }
}
