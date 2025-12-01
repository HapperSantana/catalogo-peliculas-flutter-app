import 'package:flutter/material.dart';
import 'package:flutter_application/common/helper/navigation/app_navigation.dart';
import 'package:flutter_application/data/movie/database/mispelis_database.dart';
import 'package:flutter_application/presentation/home/pages/home.dart';
import 'package:flutter_application/presentation/mispelis/pages/add_pelis_page.dart';
import 'package:flutter_application/presentation/mispelis/pages/edit_pelis_page.dart';
import 'package:flutter_application/presentation/mispelis/widgets/button_widget.dart';
import 'package:flutter_application/presentation/mispelis/widgets/dialog_box_widget.dart';
import 'package:flutter_application/presentation/mispelis/widgets/single_movie_widget.dart';

class MisPelisPage extends StatelessWidget {
  const MisPelisPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.grey[850],
          title: Text(
            "Mis Peliculas",
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                children: [
                  ButtonWidget(
                    icon: Icons.search,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ButtonWidget(
                    icon: Icons.home,
                    onTap: () {
                      AppNavigator.push(context, HomePage());
                    },
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: Container(
          width: 60,
          height: 60,
          child: FloatingActionButton(
            backgroundColor: Colors.black54,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => CreateMoviePage()));
            },
            child: Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        body: StreamBuilder(
            stream: DataBase.getMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData == false) {
                return Center(
                  child: Text("No hay Peliculas"),
                );
              }
              if (snapshot.data!.isEmpty) {
                return _noMoviesWidget();
              }
              if (snapshot.hasData) {
                final movies = snapshot.data;
                return ListView.builder(
                    itemCount: movies!.length,
                    itemBuilder: (context, index) {
                      return SingleMovieWidget(
                        posterUrl: movies[index].posterUrl,
                        title: movies[index].title,
                        color: 4294967295,
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => EditMoviePage(
                                        movieModel: movies[index],
                                      )))
                        },
                        onLongPress: () => {
                          showDialogBoxWidget(
                            context,
                            height: 250,
                            title: "Desea eliminar la pelicula?",
                            onTapYes: () {
                              DataBase.deleteMovie(movies[index].id!);
                              Navigator.pop(context);
                            },
                          )
                        },
                      );
                    });
              }
              return Center(
                child: Text("No hay Peliculas"),
              );
            }));
  }

  _noMoviesWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 200,
              height: 200,
              child: Image.asset("/assets/images/logo.png"))
        ],
      ),
    );
  }
}
