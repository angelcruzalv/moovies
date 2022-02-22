import 'package:flutter/material.dart';
import 'package:moovies/services/movies_provider.dart';
import 'package:moovies/views/casting.dart';

import 'package:moovies/views/export_views.dart';
import 'package:provider/provider.dart'; //imports from dart document

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

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
          'casting': (_) => CastingView(),
        },
        theme: ThemeData.light().copyWith(
            appBarTheme: AppBarTheme(color: Color.fromRGBO(145, 3, 168, 1.0))));
  }
}
