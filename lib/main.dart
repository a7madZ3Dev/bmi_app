import 'package:flutter/material.dart';
import 'package:bmi/constants/app_constants.dart';

import './screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline6: TextStyle(
            color: accentHexColor,
            fontWeight: FontWeight.w500,
            height: 1,
            fontSize: 40.0,
          ),
          headline5: TextStyle(
            color: accentHexColor,
            fontWeight: FontWeight.w500,
            height: 1,
            fontSize: 35.0,
          ),
          subtitle1: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            height: 1,
            fontSize: 26.0,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
