import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:riyo_movie_db/model/movie.dart';

Future<Movies> getMovies() async {
  var url = 'https://api.themoviedb.org/3/discover/movie?api_key=[YOUR_KEY_HERE]&short_by=popularity.asc';
  final response = await http.get(url,
      headers: {
        HttpHeaders.contentTypeHeader : 'application/json',
      },
  );
  print(response.statusCode.toString() + "/discover/movie");
  final responseJson = json.decode(response.body);
  return new Movies.fromJson(responseJson);
}