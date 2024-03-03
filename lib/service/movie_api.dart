import 'dart:convert';

import 'package:amc_applicaition/models/movie_model.dart';
import 'package:http/http.dart' as http;

Future<List<NewMovieModel>> fetchMovieApi() async {
  // header -> map type from documentation
  final header = {
    // to authontication
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NDA3NmNmNGI1NzI3NDhiNDgxMGYzMGNmZDVhOWI4MSIsInN1YiI6IjY1ZTRhN2JiYzk5ODI2MDE0ODYwYTEyZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TdcTBPbTR7y1yADXKoze-XXBotLp-3c1WPJeg0dUDJE",
    // to response json
    "accept": "application/json"
  };
// api url
  const urlString = "https://api.themoviedb.org/3/discover/movie";
  final http.Response response = //Future<Response> get(Uri url, {Map<String, String>? headers})
      await http.get(Uri.parse(urlString), headers: header);
      // to convert response.body fromcstring to json(map)
  Map body = json.decode(response.body);
  // to get only results from map
  List results = body["results"];
  List<NewMovieModel> newListMovies =
      results.map((movie) => NewMovieModel.fromJson(movie)).toList();
  return newListMovies;
}
