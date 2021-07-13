import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class CardSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //get screen size

    return Container(
        width: size.width * 1,
        height: size.height * .6,
        color: Colors.red,
        child: Swiper(
          //Swiper
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.9,
          itemCount: 3,
          layout: SwiperLayout.DEFAULT,
          itemBuilder: (context, int index) => GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: AssetImage('assets/no-image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ));
  }
}
