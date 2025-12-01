import 'package:cloud_firestore/cloud_firestore.dart';

class MyMovieModel {
  final String? id;
  final String title;
  final int year;
  final String director;
  final String genre;
  final String synopsis;
  final String posterUrl;

  MyMovieModel({
    this.id,
    required this.title,
    required this.year,
    required this.director,
    required this.genre,
    required this.synopsis,
    required this.posterUrl,
  });

  Map<String, dynamic> toMap() => {
        'title': title,
        'year': year,
        'director': director,
        'genre': genre,
        'synopsis': synopsis,
        'posterUrl': posterUrl,
      };

  factory MyMovieModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MyMovieModel(
      id: doc.id,
      title: data['title'] ?? '',
      year: (data['year'] ?? 0) as int,
      director: data['director'] ?? '',
      genre: data['genre'] ?? '',
      synopsis: data['synopsis'] ?? '',
      posterUrl: data['posterUrl'] ?? '',
    );
  }
}
