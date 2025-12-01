import 'package:flutter/material.dart';
import 'package:flutter_application/data/movie/database/mispelis_database.dart';
import 'package:flutter_application/data/movie/models/mispelis.dart';
import 'package:flutter_application/presentation/mispelis/widgets/button_widget.dart';
import 'package:flutter_application/presentation/mispelis/widgets/dialog_box_widget.dart';
import 'package:flutter_application/presentation/mispelis/widgets/form_widget.dart';
import 'package:toast/toast.dart';

class EditMoviePage extends StatefulWidget {
  final MisPelisModel movieModel;
  const EditMoviePage({super.key, required this.movieModel});

  @override
  State<EditMoviePage> createState() => _EditMoviePageState();
}

class _EditMoviePageState extends State<EditMoviePage> {
  TextEditingController? _titleController;
  TextEditingController? _yearController;
  TextEditingController? _synopsisController;
  TextEditingController? _directorController;
  TextEditingController? _genreController;
  TextEditingController? _posterUrlController;

  bool _isMovieEditing = false;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.movieModel.title);
    _yearController =
        TextEditingController(text: widget.movieModel.year.toString());
    _synopsisController =
        TextEditingController(text: widget.movieModel.synopsis);
    _directorController =
        TextEditingController(text: widget.movieModel.director);
    _genreController = TextEditingController(text: widget.movieModel.genre);
    _posterUrlController =
        TextEditingController(text: widget.movieModel.posterUrl);
    super.initState();
  }

  @override
  void dispose() {
    _titleController?.dispose();
    _yearController?.dispose();
    _synopsisController?.dispose();
    _directorController?.dispose();
    _genreController?.dispose();
    _posterUrlController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AbsorbPointer(
        absorbing: _isMovieEditing,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _isMovieEditing == true ? CircularProgressIndicator() : Container(),
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
                      Text(
                        "Editar Pelicula",
                        style: TextStyle(fontSize: 20),
                      ),
                      ButtonWidget(
                        icon: Icons.save_outlined,
                        onTap: () {
                          showDialogBoxWidget(
                            context,
                            height: 200,
                            title: "Desea guardar?",
                            onTapYes: () {
                              _editMovie();
                              Navigator.pop(context);
                            },
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FormWidget(
                    fontSize: 16,
                    controller: _titleController!,
                    hintText: "Titulo",
                  ),
                  FormWidget(
                    fontSize: 16,
                    controller: _yearController!,
                    hintText: "Star typing..",
                  ),
                  FormWidget(
                    fontSize: 16,
                    controller: _synopsisController!,
                    hintText: "Star typing..",
                  ),
                  FormWidget(
                    fontSize: 16,
                    controller: _directorController!,
                    hintText: "Star typing..",
                  ),
                  FormWidget(
                    fontSize: 16,
                    controller: _genreController!,
                    hintText: "Star typing..",
                  ),
                  FormWidget(
                    fontSize: 16,
                    controller: _posterUrlController!,
                    hintText: "Star typing..",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _editMovie() {
    setState(() => _isMovieEditing = true);
    Future.delayed(Duration(milliseconds: 1000)).then((value) {
      if (_titleController!.text.isEmpty) {
        Toast.show('Ingrese el Titulo');
        setState(() => _isMovieEditing = false);
        return;
      }
      if (_yearController!.text.isEmpty) {
        Toast.show('Ingrese el Año');
        setState(() => _isMovieEditing = false);
        return;
      }
      if (_synopsisController!.text.isEmpty) {
        Toast.show('Ingrese la Synopsis');
        setState(() => _isMovieEditing = false);
        return;
      }
      if (_directorController!.text.isEmpty) {
        Toast.show('Ingrese el Director');
        setState(() => _isMovieEditing = false);
        return;
      }
      if (_genreController!.text.isEmpty) {
        Toast.show('Ingrese el Género');
        setState(() => _isMovieEditing = false);
        return;
      }
      if (_posterUrlController!.text.isEmpty) {
        Toast.show('Ingrese la URL de la imagen');
        setState(() => _isMovieEditing = false);
        return;
      }
      DataBase.updateMovie(MisPelisModel(
              id: widget.movieModel.id,
              title: _titleController!.text,
              year: int.parse(_yearController!.text),
              director: _directorController!.text,
              genre: _genreController!.text,
              synopsis: _synopsisController!.text,
              posterUrl: _posterUrlController!.text))
          .then((value) {
        _isMovieEditing = false;
        Navigator.pop(context);
      });
    });
  }
}
