// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app_with_provider/models/weather_details.dart';
import 'package:weather_app_with_provider/network_manager/rest_client.dart';
import 'package:weather_app_with_provider/utils/toast_message.dart';

class WeatherDetailsProvider with ChangeNotifier {
  bool isLoading = false;
  WeatherDetailsModels models = WeatherDetailsModels();
  String cityName = "";
  String countryName = "";
  void getWeatherDetails(BuildContext context, double latitude, longitude) {
    isLoading = true;
    notifyListeners();
    RestClient.getWeahterDetails(latitude, longitude)
        .then((value) async {
          models = value;
          List<Placemark> placemarks = await placemarkFromCoordinates(
            latitude,
            longitude,
          );
          Placemark place = placemarks[0];
          cityName = place.locality!.toString();
          countryName = place.country!.toString();
          print(
            "cityName $cityName count ${place.country} ${place.locality} ${place.name} ${place.postalCode} ${place.street} ${place.subAdministrativeArea} ${place.subLocality} ${place.subThoroughfare}",
          );

          isLoading = false;
          notifyListeners();
        })
        .onError((error, stackTrace) {
          isLoading = false;
          notifyListeners();
          toastMessage(error.toString());
          print("error $error");
        });
  }
}
