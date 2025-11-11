import 'dart:convert';
import 'package:flutter_application/models/peliculas.dart';
import 'package:http/http.dart' as http;

class PeliculasServices {
  String baseUrl =
      'https://my-json-server.typicode.com/horizon-code-academy/fake-movies-api/movies';

  getPeliculas() async {
    List<Peliculas> todasPeliculas = [];
    try {
      final response = await http.get(Uri.parse(baseUrl));
      var data = response.body;
      var decodedData = jsonDecode(data);
      for (var pelicula in decodedData) {
        Peliculas nuevaPelicula = Peliculas.fromJson(pelicula);
        todasPeliculas.add(nuevaPelicula);
      }
      //print(todasPeliculas);
      return todasPeliculas;
    } catch (e) {
      return e.toString();
    }
  }
}
