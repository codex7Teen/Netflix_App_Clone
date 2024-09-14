import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app_clone/common/utils.dart';
import 'package:netflix_app_clone/models/movie_detail_model.dart';
import 'package:netflix_app_clone/models/movie_recommendation_model.dart';
import 'package:netflix_app_clone/services/api_services.dart';

class ScreenMovieDetails extends StatefulWidget {
  // getting movie id
  final int movieId;
  const ScreenMovieDetails({super.key, required this.movieId});

  @override
  State<ScreenMovieDetails> createState() => _ScreenMovieDetailsState();
}

class _ScreenMovieDetailsState extends State<ScreenMovieDetails> {
  ApiServices apiServices = ApiServices();

  late Future<MovieDetailModel> movieDetail;
  late Future<MovieRecommendationModel> movieRecommendation;

  @override
  void initState() {
    super.initState();
    fetchInitialData();
  }

  // function for getting the movie details
  fetchInitialData() {
    movieDetail = apiServices.getMovieDetail(widget.movieId);
    movieRecommendation = apiServices.getMovieRecomentation(widget.movieId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: movieDetail,
          builder: (context, snapshot) {
            // assigning datas to movie
            if (snapshot.hasData) {
              final movie = snapshot.data;
              // making all the genres accessible with a single variable by joining
              String genereText =
                  movie!.genres.map((genre) => genre.name).join(', ');
              return Column(
                children: [
                  //! big image
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "$imageUrl${movie.posterPath}",
                                ))),
                        child: SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 20),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //! movie title
                      Text(
                        movie.title,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          //! data
                          Text(movie.releaseDate.year.toString(),
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(width: 30),
                          //! genere text
                          Text(genereText,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 17)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //! description
                      Text(movie.overview,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white, fontSize: 17)),
                    ],
                  ),

                  SizedBox(height: 30),

                  FutureBuilder(
                      future: movieRecommendation,
                      builder: (context, snapshot) {
                        log("Got Recommendations based on selected movie.${snapshot.data}");
                        if (snapshot.hasData) {
                          final movieRecommendations = snapshot.data;
                          //! show recommentation if only data exists
                          return movieRecommendations!.results.isEmpty
                              ? SizedBox()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("More like this"),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    GridView.builder(
                                        itemCount:
                                            movieRecommendations.results.length,
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                mainAxisSpacing: 15,
                                                crossAxisSpacing: 5,
                                                childAspectRatio: 1.5 / 2),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                              onTap: () => Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                      builder: (context) =>
                                                          ScreenMovieDetails(
                                                              movieId:
                                                                  movieRecommendations
                                                                      .results[
                                                                          index]
                                                                      .id))),
                                              child: CachedNetworkImage(
                                                  imageUrl:
                                                      "$imageUrl${movieRecommendations.results[index].posterPath}"));
                                        })
                                  ],
                                );
                        } else {
                          return SizedBox.shrink();
                        }
                      })
                ],
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
