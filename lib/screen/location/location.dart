import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_with_provider/constant/colors.dart';
import 'package:weather_app_with_provider/provider/location_weather_provider.dart';

class LocationScareen extends StatefulWidget {
  const LocationScareen({super.key});

  @override
  State<LocationScareen> createState() => _LocationScareenState();
}

class _LocationScareenState extends State<LocationScareen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColors.deepPurple,
        title: const Text("Location"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => LocationWeatherProvider(),
        child: Consumer<LocationWeatherProvider>(
          builder: (ctx, provider, child) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            Future.delayed(const Duration(seconds: 1), () {
                              provider.getLocationWeather(value);
                            });
                          },
                          controller: searchController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            labelText: 'Search Location',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AllColors.deepPurple,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.location_pin,
                            color: AllColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: provider.model.results?.isNotEmpty ?? false,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: provider.model.results?.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(provider.model.results![index].name ?? ""),
                        subtitle: Text(
                          provider.model.results![index].country ?? "",
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
