import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app_clone/common/utils.dart';
import 'package:netflix_app_clone/models/tv_series_model.dart';

class CustomCarousel extends StatelessWidget {
  final TvSeriesModel data;

  const CustomCarousel({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SizedBox(
        width: size.width,
        height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
        child: CarouselSlider.builder(
            itemCount: data.results.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              var url = data.results[index].backdropPath.toString();

              return GestureDetector(
                  child: Column(
                    children: [
                      CachedNetworkImage(imageUrl: "$imageUrl$url"),
                      SizedBox(height: 20),
                      Text(data.results[index].name)
                    ], 
                  ));
            },
            options: CarouselOptions(
                height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
                aspectRatio: 16 / 9,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                initialPage: 0
                )));
  }
}
