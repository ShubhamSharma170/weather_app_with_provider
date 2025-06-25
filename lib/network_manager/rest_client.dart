import 'package:weather_app_with_provider/constant/api.dart';
import 'package:weather_app_with_provider/models/location_weather.dart';
import 'package:weather_app_with_provider/models/weather_details.dart';
import 'package:weather_app_with_provider/network_manager/http_helper.dart';

class RestClient {
  static final HttpHelper httpHelper = HttpHelper();

  static Future<dynamic> login(String email, String password) async {
    Object requestBody = {"email": email, "password": password};
    Map<String, dynamic> response = await httpHelper.postAPI(
      url: requre_login,
      body: requestBody,
      isRecuredAuthorization: true,
    );
    return response;
  }

  static Future<LocationWeatherModel> getLocationWeatherDetails(
    String location,
  ) async {
    Map<String, dynamic> response = await httpHelper.getAPI(
      url: "${location_weather_api}name=$location&count=5",
    );
    return LocationWeatherModel.fromJson(response);
  }

  static Future<WeatherDetailsModels> getWeahterDetails(
    double latitude,
    double longitude,
  ) async {
    Map<String, dynamic> response = await httpHelper.getAPI(
      url:
          "${weather_details_api}latitude=$latitude&longitude=$longitude&current_weather=true",
    );
    return WeatherDetailsModels.fromJson(response);
  }
}
