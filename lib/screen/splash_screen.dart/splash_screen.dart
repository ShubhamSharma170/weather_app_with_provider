import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_app_with_provider/helper/storage_helper.dart';
import 'package:weather_app_with_provider/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to login screen after 3 seconds
    Timer(Duration(seconds: 2), () {
      if (StorageHelper().getToken() == "") {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.login,
          (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.location,
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(Icons.flutter_dash, size: 100, color: Colors.white),
            Image.asset("assets/weather.webp", height: 400, width: 400),
            SizedBox(height: 20),
            // Text(
            //   "Welcome to MyApp",
            //   style: TextStyle(
            //     fontSize: 24,
            //     color: Colors.white,
            //     letterSpacing: 1.2,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
