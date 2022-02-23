import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:moovies/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({Key? key, required this.movies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //get screen size

    return Container(
        width: size.width * 1,
        height: size.height * .6,
        child: Swiper(
            //Swiper
            itemWidth: size.width * 0.6,
            itemHeight: size.height * 0.9,
            itemCount: movies.length,
            layout: SwiperLayout.DEFAULT,
            itemBuilder: (context, int index) {
              final movie = movies[index];
              // print(movie.fullPosterimgLink);
              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'details',
                    arguments: 'movie-instance'),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(movie.fullPosterimgLink),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }));
  }
}
