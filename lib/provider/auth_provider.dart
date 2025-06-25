// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:weather_app_with_provider/helper/storage_helper.dart';
import 'package:weather_app_with_provider/network_manager/rest_client.dart';
import 'package:weather_app_with_provider/routes/routes_name.dart';

class AuthProvider with ChangeNotifier {
  bool isLoading = false;

  login(String email, String password, BuildContext context) {
    isLoading = true;
    notifyListeners();

    RestClient.login(email, password)
        .then((value) {
          StorageHelper().setToken(value["token"] ?? "");
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesName.location,
            (route) => false,
          );
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
