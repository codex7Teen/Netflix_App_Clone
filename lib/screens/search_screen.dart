import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app_clone/common/utils.dart';
import 'package:netflix_app_clone/models/search_model.dart';
import 'package:netflix_app_clone/services/api_services.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  TextEditingController searchController = TextEditingController();

  ApiServices apiServices = ApiServices();

  SearchModel? searchModel;

  //! passing the textfield data to getsearchmovie function and instantaniously passing result to model.
  void search(String query) {
    apiServices.getSarchedMovies(query).then((results) {
      setState(() {
        searchModel = results;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //! Body
        body: SingleChildScrollView(
          child: Column(
            children: [
              //! Search Bar
              CupertinoSearchTextField(
                padding: EdgeInsets.all(10),
                controller: searchController,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: Icon(
                  Icons.cancel,
                  color: Colors.grey,
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
                backgroundColor: Colors.grey.withOpacity(0.25),
                onChanged: (value) {
                  if (value.isEmpty) {
                    // perform noting
                  } else {
                    search(searchController.text);
                  }
                },
              ),
              //! Grid items

              searchModel == null
                  ? const SizedBox.shrink()
                  : GridView.builder(
                      shrinkWrap: true,
                      itemCount: searchModel?.results.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 5,
                          childAspectRatio: 1.2 / 2),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            CachedNetworkImage(
                                imageUrl:
                                    "$imageUrl${searchModel!.results[index].backdropPath}",
                                height: 170),
                                SizedBox(
                                  width: 100,
                                  child: Text(searchModel!.results[index].originalTitle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                  ),
                                )
                          ],
                        );
                      })
            ],
          ),
        ),
      ),
    );
  }
}
