import 'package:flutter/material.dart';
import 'package:moovies/widgets/export_widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined))
          ],
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(children: [CardSwiper(), MovieSlider()]),
          ],
        ));
  }
}
