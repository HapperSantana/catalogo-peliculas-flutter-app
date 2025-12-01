import 'package:flutter/material.dart';
import 'package:flutter_application/common/widgets/appbar/app_bar.dart';
import 'package:flutter_application/domain/movie/entities/movie.dart';
import 'package:flutter_application/presentation/watch/widgets/recommendation_movies.dart';
import 'package:flutter_application/presentation/watch/widgets/video_overview.dart';
import 'package:flutter_application/presentation/watch/widgets/video_player.dart';
import 'package:flutter_application/presentation/watch/widgets/video_release_date.dart';
import 'package:flutter_application/presentation/watch/widgets/video_title.dart';
import 'package:flutter_application/presentation/watch/widgets/video_vote_average.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchPage({required this.movieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: movieEntity.id!),
            const SizedBox(
              height: 16,
            ),
            VideoTitle(
              title: movieEntity.title!,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDate(
                  releaseDate: movieEntity.releaseDate!,
                ),
                VideoVoteAverage(
                  voteAverage: movieEntity.voteAverage!,
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    null;
                  },
                  label: Text(
                    'Comparte en Redes',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.share,
                    color: Colors.blueAccent,
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    null;
                  },
                  icon: Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  label: Text(
                    'Califica la película',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            VideoOverview(
              overview: movieEntity.overview!,
            ),
            const SizedBox(
              height: 16,
            ),
            RecommendationsMovies(movieId: movieEntity.id!),
            const SizedBox(
              height: 16,
            ),
            /*  SimilarMovies(movieId: movieEntity.id!) */
          ],
        ),
      ),
    );
  }
}
