import 'package:flutter/material.dart';
import 'package:netflix_app_clone/screens/splash_screen.dart';

class ScreenNoInternet extends StatelessWidget {
  const ScreenNoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.signal_wifi_statusbar_connected_no_internet_4_rounded,
              color: Colors.white,
              size: 90,
            ),
            SizedBox(height: 30),
            Text(
              'No internet connection!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text('Please check your network connection.', style: TextStyle(color: Colors.grey),),
            SizedBox(
              height: 20,
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                width: 122,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(2)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    Text('TRY AGAIN', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    SizedBox(width: 5,)
                  ],
                ),
              ),
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ScreenSplash())),
            )
          ],
        ),
      ),
    );
  }
}
