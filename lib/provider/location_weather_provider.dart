// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:weather_app_with_provider/models/location_weather.dart';
import 'package:weather_app_with_provider/network_manager/rest_client.dart';

class LocationWeatherProvider with ChangeNotifier {
  LocationWeatherModel model = LocationWeatherModel();
  void getLocationWeather(String location) async {
    RestClient.getLocationWeatherDetails(location)
        .then((value) async {
          model = value;
          notifyListeners();
        })
        .onError((error, stackTrace) {
          print("error $error");
          notifyListeners();
        });
  }
}
