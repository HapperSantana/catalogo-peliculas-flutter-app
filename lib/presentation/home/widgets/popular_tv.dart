import 'package:flutter/material.dart';
import 'package:flutter_application/common/bloc/generic_data_cubit.dart';
import 'package:flutter_application/common/bloc/generic_data_state.dart';
import 'package:flutter_application/common/widgets/tv/tv_card.dart';
import 'package:flutter_application/domain/tv/entities/tv.dart';
import 'package:flutter_application/domain/tv/usecases/get_popular_tv.dart';
import 'package:flutter_application/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<TVEntity>>(sl<GetPopularTVUseCase>()),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is DataLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TVCard(tvEntity: state.data[index]);
                },
                padding: EdgeInsets.symmetric(horizontal: 16),
                separatorBuilder: (context, index) => SizedBox(width: 8),
                itemCount: state.data.length,
              ),
            );
          } else if (state is FailureLoadData) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
