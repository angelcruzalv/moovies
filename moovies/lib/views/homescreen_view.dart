import 'package:flutter/material.dart';
import 'package:moovies/services/movies_provider.dart';
import 'package:moovies/widgets/export_widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          title: Text('Now Playing'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined))
          ],
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(children: [
              CardSwiper(
                movies: moviesProvider.nowPlayingMovies,
              ),
              MovieSlider(
                movies: moviesProvider.popularMovies,
              )
            ]),
          ],
        ));
  }
}
