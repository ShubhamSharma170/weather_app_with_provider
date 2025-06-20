import 'package:flutter/material.dart';
import 'package:weather_app_with_provider/routes/routes.dart';
import 'package:weather_app_with_provider/screen/auth/login.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginScreen(),
      onGenerateRoute: (settings) => Routes.generateRoutes(settings),
      navigatorKey: navigatorKey,
    );
  }
}
