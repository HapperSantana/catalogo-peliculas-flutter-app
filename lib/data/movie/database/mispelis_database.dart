import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/data/movie/models/mispelis.dart';

class DataBase {
  static Future<void> createMovie(MisPelisModel movie) async {
    final movieCollection = FirebaseFirestore.instance.collection("MyMovies");
    final id = movieCollection.doc().id;
    final newMovie = MisPelisModel(
            id: id,
            title: movie.title,
            year: movie.year,
            director: movie.director,
            genre: movie.genre,
            synopsis: movie.synopsis,
            posterUrl: movie.posterUrl)
        .toDocument();

    try {
      movieCollection.doc(id).set(newMovie);
    } catch (e) {
      print("Ocurrio un error $e");
    }
  }

  static Stream<List<MisPelisModel>> getMovies() {
    final movieCollection = FirebaseFirestore.instance.collection("MyMovies");
    return movieCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => MisPelisModel.fromSnapshot(e)).toList());
  }

  static Future<void> updateMovie(MisPelisModel movie) async {
    final movieCollection = FirebaseFirestore.instance.collection("MyMovies");
    final newMovie = MisPelisModel(
            id: movie.id,
            title: movie.title,
            year: movie.year,
            director: movie.director,
            genre: movie.genre,
            synopsis: movie.synopsis,
            posterUrl: movie.posterUrl)
        .toDocument();

    try {
      await movieCollection.doc(movie.id).update(newMovie);
    } catch (e) {
      print("No se pudo actualizar $e");
    }
  }

  static Future<void> deleteMovie(String id) async {
    final movieCollection = FirebaseFirestore.instance.collection("MyMovies");
    try {
      await movieCollection.doc(id).delete();
    } catch (e) {
      print("No se pudo elimiar $e");
    }
  }
}
