import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_app_clone/screens/no_internet_screen.dart';
import 'package:netflix_app_clone/widgets/bottom_nav.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
//! goes check for data-connection and proceeding
  @override
  void initState() {
    super.initState();
    checkDataConnction();
  }

  //! Method to check for data-connection and proceeding
  void checkDataConnction() async {
    final connectionResult = await Connectivity().checkConnectivity();
    if (connectionResult == ConnectivityResult.none) {
      // No connection available, Naviagte to NoConnection Screen
      Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => ScreenNoInternet())));
    } else {
      // Data connection available, proceed
      Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => BottomNavBar())));
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset("assets/netflix.json"));
  }
}
