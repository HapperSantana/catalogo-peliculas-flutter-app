import 'package:flutter/material.dart';

class SingleMovieWidget extends StatelessWidget {
  final String? title;
  final String? synopsis;
  final String? director;
  final int? year;
  final String? posterUrl;
  final String? genre;
  final int? color;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const SingleMovieWidget(
      {super.key,
      this.title,
      this.synopsis,
      this.director,
      this.year,
      this.genre,
      this.posterUrl,
      this.color,
      this.onTap,
      this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(color!), borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(posterUrl!),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  title!,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
