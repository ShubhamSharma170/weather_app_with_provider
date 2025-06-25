import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_with_provider/constant/colors.dart';
import 'package:weather_app_with_provider/provider/weather_details_provider.dart';
import 'package:weather_app_with_provider/utils/loadingIndicator.dart';

class WeatherScreen extends StatefulWidget {
  final double latitude;
  final double longitude;
  const WeatherScreen({
    required this.latitude,
    required this.longitude,
    super.key,
  });

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColors.deepPurple,
        title: const Text("Weather Deatils"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      body: ChangeNotifierProvider(
        create:
            (context) =>
                WeatherDetailsProvider()..getWeatherDetails(
                  context,
                  widget.latitude,
                  widget.longitude,
                ),
        child: Consumer<WeatherDetailsProvider>(
          builder: (ctx, provider, child) {
            return provider.isLoading
                ? loadingIndicator()
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "${provider.cityName},${provider.countryName}",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        Jiffy.now().yMMMMEEEEdjm,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset("assets/weather.webp"),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "${provider.models.currentWeather?.temperature ?? ""} ${provider.models.currentWeatherUnits?.temperature ?? ""}",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Wind Speed ${provider.models.currentWeather?.windspeed ?? ""} ${provider.models.currentWeatherUnits?.windspeed ?? ""}",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
          },
        ),
      ),
    );
  }
}
