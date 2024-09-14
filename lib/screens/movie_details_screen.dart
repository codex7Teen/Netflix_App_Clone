import 'package:flutter/material.dart';
import 'package:netflix_app_clone/common/utils.dart';
import 'package:netflix_app_clone/models/movie_detail_model.dart';
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

  @override
  void initState() {
    super.initState();
    fetchInitialData();
  }

  // function for getting the movie details
  fetchInitialData() {
    movieDetail = apiServices.getMovieDetail(widget.movieId);
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
              String genereText = movie!.genres.map((genre) => genre.name).join(', ');
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

                  Column(
                    children: [
                      //! movie title
                      Text(movie.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          //! data
                          Text(movie.releaseDate.year.toString(),style: TextStyle(color: Colors.grey)),
                          SizedBox(width: 30),
                          //! genere text
                          Text(genereText, style: TextStyle(color: Colors.grey, fontSize: 17)),
                        ],
                      ),
                       SizedBox(height: 20,),
                       //! description
                       Text(movie.overview,
                       maxLines: 6,
                       overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white, fontSize: 17)),
                    ],
                  )
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
