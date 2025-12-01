import 'package:flutter/material.dart';
import 'package:flutter_application/common/widgets/movie/mymovie_card.dart';
import 'package:flutter_application/presentation/home/bloc/mymovies_cubit.dart';
import 'package:flutter_application/presentation/home/bloc/mymovies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyMovies extends StatelessWidget {
  const MyMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyMoviesCubit()..getAllMyMovies(),
      child: BlocBuilder<MyMoviesCubit, MyMoviesState>(
        builder: (context, state) {
          if (state is MyMoviesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MyMoviesLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MyMovieCard(mymovieEntity: state.movies[index]);
                },
                padding: EdgeInsets.symmetric(horizontal: 16),
                separatorBuilder: (context, index) => SizedBox(width: 8),
                itemCount: state.movies.length,
              ),
            );
          } else if (state is MyMoviesError) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
