import 'package:flutter/material.dart';

class VideoOverview extends StatelessWidget {
  final String overview;
  const VideoOverview({required this.overview, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Synopsis",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          overview,
          style: Theme.of(context).primaryTextTheme.bodyMedium,
        )
      ],
    );
  }
}
