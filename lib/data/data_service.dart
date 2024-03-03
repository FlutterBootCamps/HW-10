import 'package:amc_applicaition/dataset/cinema.dart';
import 'package:amc_applicaition/dataset/data.dart';
import 'package:amc_applicaition/models/cinemas_model.dart';
import 'package:amc_applicaition/models/movie_model.dart';
import 'package:amc_applicaition/service/movie_api.dart';

class DataService {
  List<NewMovieModel> movieList = [];
  List<LocationData> locationList = [];

  // to add the movie to list
  Future<void> fetchMovies() async {
    movieList = await fetchMovieApi();
  }

  // to add the locations to list
  void fetchLocations() {
    for (var element in cinemaData) {
      locationList.add(LocationData.fromJson(element));
    }
  }
}
