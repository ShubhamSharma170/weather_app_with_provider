// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:weather_app_with_provider/network_manager/rest_client.dart';

class AuthProvider with ChangeNotifier {
  bool isLoading = false;

  login(String email, String password) {
    isLoading = true;
    notifyListeners();

    RestClient.login(email, password)
        .then((value) {
          isLoading = false;
          notifyListeners();
        })
        .onError((error, stackTrace) {
          print("error $error");
          isLoading = false;
          notifyListeners();
        });
  }
}
