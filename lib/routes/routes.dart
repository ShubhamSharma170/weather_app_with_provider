import 'package:weather_app_with_provider/screen/auth/login.dart';
import 'package:weather_app_with_provider/screen/location/location.dart';
import 'package:weather_app_with_provider/screen/weather_screen/weather_screen.dart';

import 'routes_name.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        );
      case RoutesName.location:
        return MaterialPageRoute(
          builder: (BuildContext context) => LocationScareen(),
        );
      case RoutesName.weather:
        var args = settings.arguments as Map<String, dynamic>;
        double latitude = args['latitude'];
        double longitude = args['longitude'];
        return MaterialPageRoute(
          builder:
              (BuildContext context) =>
                  WeatherScreen(latitude: latitude, longitude: longitude),
        );
      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text("No Route Found"))),
        );
    }
  }
}
