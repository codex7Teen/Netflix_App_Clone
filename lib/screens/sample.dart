// import 'dart:async';

// import 'package:flutter/material.dart';

// class Debouncer{
//   final int milliSeconds;
//   VoidCallback? action;
//   Timer? timer;

//   Debouncer({required this.milliSeconds});

//   run(VoidCallback action){
//     if(timer != null){
//       timer!.cancel();
//     }
//     Timer(Duration(milliseconds: milliSeconds), action);
//   }
// }


//DEBOUNCER