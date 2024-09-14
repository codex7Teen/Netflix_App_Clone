import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ComingSoonMovieWidget extends StatelessWidget {
  final String imageUrl;
  final String overview;
  final String logoUrl;
  final String month;
  final String day;

  const ComingSoonMovieWidget(
      {super.key,
      required this.imageUrl,
      required this.overview,
      required this.logoUrl,
      required this.month,
      required this.day});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! month and day
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  month,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  month,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      letterSpacing: 5),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          //! image
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(imageUrl: imageUrl),

              //! logo and icons below image
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.5,
                    height: size.height * 0.2,
                    child: CachedNetworkImage(
                      imageUrl: logoUrl,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  Spacer(),
                  //! icons
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.notifications_none_rounded,
                      size: 25,
                      color: Colors.white,
                      ),
                      SizedBox(height: 5),
                      Text("Remind me",
                      style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Icon(Icons.info_outline_rounded,
                      size: 25,
                      color: Colors.white,
                      ),
                      SizedBox(height: 5),
                      Text("Info",
                      style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                  SizedBox(width: 10,)
                ],
              ),
              SizedBox(height: 10,),
              //! title and description
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Coming on $month $day",
                  style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17
                  ),
                  ),
                  SizedBox(height: 10,),
                   Text(overview,
                   maxLines: 4,
                  style: TextStyle(color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis
                  ),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
