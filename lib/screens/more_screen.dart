import 'package:flutter/material.dart';

class ScreenMore extends StatelessWidget {
  const ScreenMore({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
     child: SafeArea(child: 
     Scaffold(
      //! appbar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text("New & Hot",
        style: TextStyle(
          color: Colors.white
        ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.cast, color: Colors.white,),
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                color: Colors.blue,
                height: 27,
                width: 27,
              ),
            ),
            SizedBox(width: 20,)
        ],
        //! Tab-bar
        bottom: TabBar(
          dividerColor: Colors.black,
          isScrollable: false,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white 
          ),
          labelColor: Colors.black,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
     )
     ));
  }
}