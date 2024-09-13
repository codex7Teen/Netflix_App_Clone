import 'dart:convert';
import 'dart:developer';

import 'package:netflix_app_clone/common/utils.dart';
import 'package:netflix_app_clone/models/nowplaying_model.dart';
import 'package:netflix_app_clone/models/tv_series_model.dart';
import 'package:netflix_app_clone/models/upcoming_model.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_app_clone/widgets/custom_carousel.dart';

const baseUrl = "https://api.themoviedb.org/3/";
const key = "?api_key=$apiKey";
late String endPoint;

class ApiServices {

  //! Upcoming movies
  Future<UpcomingMovieModel> getUpcomingMovies() async {
    endPoint = "movie/upcoming";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log("Upcoming Movie Success");
      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load upcoming movies");
    }
  }

  //! Now Playing 
  Future<NowPlayingModel> getNowplayingMovies() async {
    endPoint = "movie/now_playing";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      log("NowPlaying Success");
      return NowPlayingModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load nowPlaying");
    }
  }

  //! custom carousel
  Future<TvSeriesModel> getTopRatedSeries() async {
    endPoint = "tv/top_rated";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      log("TopRated Success");
      return TvSeriesModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load Top-rated");
    }
  }


}
