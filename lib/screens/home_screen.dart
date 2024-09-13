import 'package:flutter/material.dart';
import 'package:netflix_app_clone/models/nowplaying_model.dart';
import 'package:netflix_app_clone/models/upcoming_model.dart';
import 'package:netflix_app_clone/services/api_services.dart';
import 'package:netflix_app_clone/widgets/now_playing_movie_card.dart';
import 'package:netflix_app_clone/widgets/upcoming_movie_card.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late Future<UpcomingMovieModel> upcomingFuture;
  late Future<NowPlayingModel> nowplayingFuture;

  ApiServices apiServices = ApiServices();

  //! getting datas from api
  @override
  void initState() {
    super.initState();
    nowplayingFuture = apiServices.getNowplayingMovies();
    upcomingFuture = apiServices.getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //! Appbar
        appBar: AppBar(
          title: Image.asset(
            'assets/logo.png',
            height: 50,
            width: 120,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  )),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                color: Colors.blue,
                height: 27,
                width: 27,
              ),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        //! Body
        body: SingleChildScrollView(
          child: Column(
            children: [
              //! Now Playing
              SizedBox(
                height: 220,
                child: NowplayingMovieCard(future: nowplayingFuture, headLineText: 'Now Playing')
              ), 
              //! UpComing Movies
              SizedBox(
                height: 220,
                child: UpcomingMovieCard(
                    future: upcomingFuture, headLineText: 'Upcoming Movies'),
              ), 
            ],
          ),
        ));
  }
}
