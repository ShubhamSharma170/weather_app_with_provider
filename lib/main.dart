import 'package:flutter/material.dart';
import 'package:weather_app_with_provider/helper/storage_helper.dart';
import 'package:weather_app_with_provider/routes/routes.dart';
import 'package:weather_app_with_provider/screen/splash_screen.dart/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
      onGenerateRoute: (settings) => Routes.generateRoutes(settings),
      navigatorKey: navigatorKey,
    );
  }
}
