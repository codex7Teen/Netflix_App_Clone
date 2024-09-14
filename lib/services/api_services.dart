import 'dart:convert';
import 'dart:developer';

import 'package:netflix_app_clone/common/utils.dart';
import 'package:netflix_app_clone/models/movie_detail_model.dart';
import 'package:netflix_app_clone/models/movie_recommendation_model.dart';
import 'package:netflix_app_clone/models/nowplaying_model.dart';
import 'package:netflix_app_clone/models/search_model.dart';
import 'package:netflix_app_clone/models/tv_series_model.dart';
import 'package:netflix_app_clone/models/upcoming_model.dart';
import 'package:http/http.dart' as http;

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

  //! Custom carousel
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

  //! Search movie
  Future<SearchModel> getSarchedMovies(String searchText) async {
    endPoint = "search/movie?query=$searchText";
    final url = "$baseUrl$endPoint";

    print("Search url is $url");

    final response = await http.get(Uri.parse(url), headers: {
      'Authorization':"Bearer $apiAuthorizationToken"
    });

    if(response.statusCode == 200) {
      log("Search Success");
      return SearchModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load searched movie");
    }
  }

  //! Movie Recommendation
  Future<MovieRecommendationModel> getPopularMovies() async {
    endPoint = "movie/popular";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      log("Movie Recommendations success");

      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load movie recommendations");
    }
  }

  //! Movie Details
  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    endPoint = "movie/$movieId";
    final url = "$baseUrl$endPoint$key";

    print("Movie detail url is $url");

    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      log("Movie Details fetch Success");
      return MovieDetailModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load movie-detail");
    }
  }

  
  //! Movie Selected Recommendation
  Future<MovieRecommendationModel> getMovieRecomentation(int movieId) async {
    endPoint = "movie/$movieId/recommendations";
    final url = "$baseUrl$endPoint$key";

    print("recommendations url is $url");

    final response = await http.get(Uri.parse(url)); 

    if(response.statusCode == 200) {
      log("Movie Recomentaions fetch Success"); 
      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load more movies like this!!!");
    }
  }

}
