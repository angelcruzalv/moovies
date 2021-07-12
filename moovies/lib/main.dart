import 'package:flutter/material.dart';

import 'package:moovies/views/export_views.dart'; //imports from dart document

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomeScreen(),
          'details': (_) => DetailsView(),
        },
        theme: ThemeData.light().copyWith(
            appBarTheme:
                AppBarTheme(color: Color.fromRGBO(80, 111, 180, 1.0))));
  }
}
