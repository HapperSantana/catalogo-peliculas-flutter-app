import 'package:flutter/material.dart';
import 'package:flutter_application/common/helper/navigation/app_navigation.dart';
import 'package:flutter_application/core/configs/theme/app_colors.dart';
import 'package:flutter_application/domain/movie/entities/mymovie.dart';
import 'package:flutter_application/presentation/watch/pages/mymovie_watch.dart';

class MyMovieCard extends StatelessWidget {
  final MyMovieEntity mymovieEntity;
  const MyMovieCard({required this.mymovieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(
            context,
            MyMovieWatchPage(
              mymovieEntity: mymovieEntity,
            ));
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(mymovieEntity.posterUrl)),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mymovieEntity.title,
                      style: const TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
