import 'package:flutter/material.dart';
import 'package:netflix_app_clone/common/utils.dart';
import 'package:netflix_app_clone/models/nowplaying_model.dart';
import 'package:netflix_app_clone/screens/movie_details_screen.dart';

class NowplayingMovieCard extends StatelessWidget {
  final Future<NowPlayingModel> future;
  final String headLineText;

  const NowplayingMovieCard(
      {super.key, required this.future, required this.headLineText});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          //! return the column if snapshot has recieved data else return a sizedbox
          if (snapshot.hasData) {
            //! storing data inside data
            var data = snapshot.data?.results;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headLineText,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded( 
                  child: ListView.builder( 
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenMovieDetails(movieId: data[index].id))),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          //! displaying the image
                          child:
                              Image.network("$imageUrl${data[index].posterPath}"),
                        ),
                      );
                    },
                    itemCount: data!.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  ),
                )
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator(color: Colors.grey,));
          }
        });
  }
}
