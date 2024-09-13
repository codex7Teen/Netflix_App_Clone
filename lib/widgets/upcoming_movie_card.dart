import 'package:flutter/material.dart';
import 'package:netflix_app_clone/common/utils.dart';
import 'package:netflix_app_clone/models/upcoming_model.dart';

class UpcomingMovieCard extends StatelessWidget {
  final Future<UpcomingMovieModel> future;
  final String headLineText;

  const UpcomingMovieCard(
      {super.key, required this.future, required this.headLineText});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          //! return the colmn if snapshot has recieved data else return a sizedbox
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
                      return Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        //! displaying the image
                        child:
                            Image.network("$imageUrl${data[index].posterPath}"),
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
            return SizedBox.shrink();
          }
        });
  }
}
