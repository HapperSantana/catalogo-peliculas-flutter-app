import 'package:flutter/material.dart';
import 'package:flutter_application/common/helper/navigation/app_navigation.dart';
import 'package:flutter_application/common/widgets/appbar/app_bar.dart';
import 'package:flutter_application/core/configs/assets/app_vectors.dart';
import 'package:flutter_application/presentation/mispelis/pages/mis_pelis_page.dart';
import 'package:flutter_application/presentation/home/widgets/category_text.dart';
import 'package:flutter_application/presentation/home/widgets/mymovies.dart';
import 'package:flutter_application/presentation/home/widgets/now_playing_movies.dart';
/* import 'package:flutter_application/presentation/home/widgets/popular_tv.dart';
 */
import 'package:flutter_application/presentation/home/widgets/trending_movies.dart';
import 'package:flutter_application/services/auth_service.dart';

import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "Administrador",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                "admin@bestmovies.com",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://media.istockphoto.com/id/1623303770/photo/creative-background-image-is-blurred-evening-city-lights-and-light-snowfall.webp?b=1&s=612x612&w=0&k=20&c=--I6QisPR7yGmgujOI2co8U3FIK5tBv6xAjMup67ghc="))),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/5556/5556468.png'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Ir a Home"),
              onTap: () {
                AppNavigator.push(context, HomePage());
              },
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart_rounded),
              title: const Text("Reportes"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text("Mis Likes"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text("Mis Peliculas"),
              onTap: () {
                AppNavigator.push(context, MisPelisPage());
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_2_outlined),
              title: const Text("Mi Perfil"),
              onTap: () {},
            ),
            SizedBox(
              height: 50,
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Cerrar Sesión"),
              onTap: () async {
                await AuthService().signOut(context: context);
              },
            ),
          ],
        ),
      ),
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(AppVectors.logo, height: 50),
        action: IconButton(onPressed: () {}, icon: Icon(Icons.search_sharp)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoryText(title: 'En tendecia 🔥'),
            TrendingMovies(),
            SizedBox(height: 16),
            CategoryText(title: 'En cartelera 🎬'),
            SizedBox(height: 16),
            NowPlayingMovies(),
            SizedBox(height: 16),
            /* CategoryText(title: 'Populares en TV'),
            PopularTv(),
            SizedBox(height: 16), */
            CategoryText(title: 'Mis Peliculas'),
            MyMovies(),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}
