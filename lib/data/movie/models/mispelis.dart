import 'package:cloud_firestore/cloud_firestore.dart';

class MisPelisModel {
  final String? id;
  final String title;
  final int year;
  final String director;
  final String genre;
  final String synopsis;
  final String posterUrl;

  MisPelisModel({
    this.id,
    required this.title,
    required this.year,
    required this.director,
    required this.genre,
    required this.synopsis,
    required this.posterUrl,
  });

  Map<String, dynamic> toDocument() => {
        'id': id,
        'title': title,
        'year': year,
        'director': director,
        'genre': genre,
        'synopsis': synopsis,
        'posterUrl': posterUrl,
      };

  factory MisPelisModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return MisPelisModel(
      id: snapshot['id'],
      title: snapshot['title'] ?? '',
      year: (snapshot['year'] ?? 0) as int,
      director: snapshot['director'] ?? '',
      genre: snapshot['genre'] ?? '',
      synopsis: snapshot['synopsis'] ?? '',
      posterUrl: snapshot['posterUrl'] ?? '',
    );
  }
}
