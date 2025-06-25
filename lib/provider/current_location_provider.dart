// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:weather_app_with_provider/helper/geolocator_handler.dart';
import 'package:weather_app_with_provider/routes/routes_name.dart';
import 'package:weather_app_with_provider/utils/toast_message.dart';

class CurrentLocationProvider with ChangeNotifier {
  bool isCurrentLocation = false;

  getCurrentLocation(BuildContext context) {
    isCurrentLocation = true;
    notifyListeners();
    determinePosition()
        .then((value) {
          isCurrentLocation = false;
          notifyListeners();
          Navigator.pushNamed(
            context,
            RoutesName.weather,
            arguments: {
              "latitude": value.latitude,
              "longitude": value.longitude,
            },
          );
        })
        .onError((error, stackTrace) {
          isCurrentLocation = false;
          notifyListeners();
          toastMessage(error.toString());
        });
  }
}
