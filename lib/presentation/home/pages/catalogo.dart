import 'package:flutter/material.dart';
import 'package:flutter_application/services/peliculas_services.dart';

class CatalogoPage extends StatelessWidget {
  const CatalogoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Peliculas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Acción de refrescar
              PeliculasServices().getPeliculas();
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: PeliculasServices().getPeliculas(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Ocurrió un error: ${snapshot.error}'),
            );
          }
          if (snapshot.hasData) {
            final peliculas = snapshot.data as List<dynamic>;
            return ListView.builder(
              itemCount: peliculas.length,
              itemBuilder: (context, index) {
                final pelicula = peliculas[index];
                return ListTile(
                  leading: pelicula.poster != null
                      ? Image.network(pelicula.poster!)
                      : const SizedBox.shrink(),
                  title: Text(pelicula.title ?? 'Sin título'),
                  subtitle: Text(
                      'Año ${pelicula.year ?? 'Año desconocido'} - Duración ${pelicula.runtime ?? 'Duración desconocida'}'),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
