import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moovies/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = 'de4c5723f2c97517f2241cc13446df0b';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-MX';

  List<Movie> nowPlayingMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    print('MoviesProvider started console test');
    this.getNowPlayingMovies();
    this.getPopularMovies();
  }
  getNowPlayingMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    //final Map<String, dynamic> decodedData = json.decode(response.body);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    //print(nowPlaying.results[0].title);
    nowPlayingMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    //final Map<String, dynamic> decodedData = json.decode(response.body);
    final popularResponse = PopularResponse.fromJson(response.body);

    //print(nowPlaying.results[0].title);
    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();
  }
}
