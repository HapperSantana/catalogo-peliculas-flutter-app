import 'package:flutter/material.dart';
import 'package:flutter_application/data/movie/database/mispelis_database.dart';
import 'package:flutter_application/data/movie/models/mispelis.dart';
import 'package:flutter_application/presentation/mispelis/widgets/button_widget.dart';
import 'package:flutter_application/presentation/mispelis/widgets/form_widget.dart';
import 'package:toast/toast.dart';

class CreateMoviePage extends StatefulWidget {
  const CreateMoviePage({super.key});

  @override
  State<CreateMoviePage> createState() => _CreateMoviePageState();
}

class _CreateMoviePageState extends State<CreateMoviePage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _yearController = TextEditingController();
  TextEditingController _synopsisController = TextEditingController();
  TextEditingController _directorController = TextEditingController();
  TextEditingController _genreController = TextEditingController();
  TextEditingController _posterUrlController = TextEditingController();

  bool _isMovieCreating = false;

  @override
  void dispose() {
    _titleController.dispose();
    _yearController.dispose();
    _synopsisController.dispose();
    _directorController.dispose();
    _genreController.dispose();
    _posterUrlController.dispose();
    return super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AbsorbPointer(
        absorbing: _isMovieCreating,
        child: Stack(alignment: Alignment.center, children: [
          _isMovieCreating == true ? CircularProgressIndicator() : Container(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWidget(
                      icon: Icons.arrow_back,
                      onTap: () => Navigator.pop(context),
                    ),
                    ButtonWidget(
                      icon: Icons.done,
                      onTap: () {
                        _createMovie();
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                FormWidget(
                  fontSize: 16,
                  controller: _titleController,
                  hintText: "Titulo",
                ),
                FormWidget(
                  fontSize: 16,
                  controller: _yearController,
                  hintText: "Año",
                ),
                FormWidget(
                  maxLines: 10,
                  fontSize: 16,
                  controller: _synopsisController,
                  hintText: "Synopsis",
                ),
                FormWidget(
                  fontSize: 16,
                  controller: _directorController,
                  hintText: "Director",
                ),
                FormWidget(
                  fontSize: 16,
                  controller: _genreController,
                  hintText: "Género",
                ),
                FormWidget(
                  fontSize: 16,
                  controller: _posterUrlController,
                  hintText: "URL de la imagen",
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  _createMovie() {
    setState(() => _isMovieCreating = true);
    Future.delayed(Duration(milliseconds: 1000)).then((value) {
      if (_titleController.text.isEmpty) {
        Toast.show('Ingrese el Titulo');
        setState(() => _isMovieCreating = false);
        return;
      }
      if (_yearController.text.isEmpty) {
        Toast.show('Ingrese el Año');
        setState(() => _isMovieCreating = false);
        return;
      }
      if (_synopsisController.text.isEmpty) {
        Toast.show('Ingrese la Synopsis');
        setState(() => _isMovieCreating = false);
        return;
      }
      if (_directorController.text.isEmpty) {
        Toast.show('Ingrese el Director');
        setState(() => _isMovieCreating = false);
        return;
      }
      if (_genreController.text.isEmpty) {
        Toast.show('Ingrese el Género');
        setState(() => _isMovieCreating = false);
        return;
      }
      if (_posterUrlController.text.isEmpty) {
        Toast.show('Ingrese la URL de la imagen');
        setState(() => _isMovieCreating = false);
        return;
      }
      DataBase.createMovie(MisPelisModel(
              title: _titleController.text,
              year: int.parse(_yearController.text),
              director: _directorController.text,
              genre: _genreController.text,
              synopsis: _synopsisController.text,
              posterUrl: _posterUrlController.text))
          .then((value) {
        _isMovieCreating = false;
        Navigator.pop(context);
      });
    });
  }
}
