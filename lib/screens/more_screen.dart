import 'package:flutter/material.dart';
import 'package:netflix_app_clone/widgets/coming_soon_movie.dart';

class ScreenMore extends StatelessWidget {
  const ScreenMore({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
            child: Scaffold(
                //! appbar
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.black,
                  title: Text(
                    "New & Hot",
                    style: TextStyle(color: Colors.white),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.cast,
                        color: Colors.white,
                      ),
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
                  //! Tab-bar
                  bottom: TabBar(
                      dividerColor: Colors.black,
                      isScrollable: false,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      labelColor: Colors.black,
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      unselectedLabelColor: Colors.white,
                      tabs: [
                        Tab(
                          text: "   🍿  Coming Soon    ",
                        ),
                        Tab(
                          text: "   🔥  Everyone's Watching   ",
                        )
                      ]),
                ),
                //! b o d y
                body: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ComingSoonMovieWidget(
                            imageUrl:
                                'https://panandslam.com/wp-content/uploads/2022/12/avatar-2-blue.png',
                            overview:
                                '“Avatar: The Way of Water tells the story of the Sully family, the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive and the tragedies they endure.',
                            logoUrl:
                                "https://i.pinimg.com/1200x/b7/3e/b9/b73eb9762bddad655c4d9ec14e5fbc2f.jpg",
                            month: "Mar",
                            day: "15",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ComingSoonMovieWidget(
                            imageUrl:
                                'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
                            overview:
                                'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
                            logoUrl:
                                "https://s3.amazonaws.com/www-inside-design/uploads/2017/10/strangerthings_feature-983x740.jpg",
                            month: "Jun",
                            day: "19",
                          ),
                        ],
                      ),
                    ),
                    ComingSoonMovieWidget(
                      imageUrl:
                          'https://i.pinimg.com/originals/c3/79/30/c37930f12e20a00c8fa9d61b9aa46ef6.jpg',
                      overview:
                          'Premise. Set in Madrid, a mysterious man known as the "Professor" recruits a group of eight people, who choose city names as their aliases, to carry out an ambitious plan that involves entering the Royal Mint of Spain, and escaping with €984 million.',
                      logoUrl:
                          "https://cdn.entries.clios.com/ems_media/72/2268/124436/49yIPDnzLo9y9ufvrFP4Id5GT1IJk7m8J4SfNvYH-ocv_ems720pv_ems720p_thumb.png",
                      month: "Nov",
                      day: "23",
                    ),
                  ],
                ))));
  }
}
