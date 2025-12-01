import 'package:flutter/material.dart';
import 'package:flutter_application/common/widgets/appbar/app_bar.dart';
import 'package:flutter_application/domain/movie/entities/mymovie.dart';

class MyMovieWatchPage extends StatelessWidget {
  final MyMovieEntity mymovieEntity;
  const MyMovieWatchPage({required this.mymovieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
      ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          backgroundColor: Colors.black54,
          onPressed: () {
            null;
          },
          child: Icon(
            Icons.favorite_border_rounded,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(mymovieEntity.posterUrl),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            //MyMoviePoster(url: mymovieEntity.posterUrl),
            Text(
              mymovieEntity.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    null;
                  },
                  icon: Icon(
                    Icons.calendar_month,
                    color: Colors.grey,
                    size: 20,
                  ),
                  label: Text(mymovieEntity.year.toString(),
                      style: TextStyle(color: Colors.grey)),
                ),
                TextButton.icon(
                  onPressed: () {
                    null;
                  },
                  icon: Icon(
                    Icons.closed_caption_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  label: Text(mymovieEntity.genre,
                      style: TextStyle(color: Colors.grey)),
                ),
                TextButton.icon(
                  onPressed: () {
                    null;
                  },
                  icon: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 20,
                  ),
                  label: Text('5.7', style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {
                    null;
                  },
                  icon: Icon(
                    Icons.movie_creation_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  label: Text(mymovieEntity.director,
                      style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
            SizedBox(
              height: 16,
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
              height: 16,
            ),
            Text(
              "Synopsis",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              mymovieEntity.synopsis,
              style: Theme.of(context).primaryTextTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
