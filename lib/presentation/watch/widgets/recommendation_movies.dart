import 'package:flutter/material.dart';
import 'package:flutter_application/common/widgets/movie/movie_card.dart';
import 'package:flutter_application/presentation/watch/bloc/recommendation_movies_cubit.dart';
import 'package:flutter_application/presentation/watch/bloc/recommendation_movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationsMovies extends StatelessWidget {
  final int movieId;
  const RecommendationsMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RecommendationMoviesCubit()..getRecommendationMovies(movieId),
      child: BlocBuilder<RecommendationMoviesCubit, RecommendationMoviesState>(
        builder: (context, state) {
          if (state is RecommendationMoviesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RecommendationMoviesLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recomendaciones',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MovieCard(movieEntity: state.movies[index]);
                    },
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    separatorBuilder: (context, index) => SizedBox(width: 8),
                    itemCount: state.movies.length,
                  ),
                ),
              ],
            );
          } else if (state is RecommendationMoviesError) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
