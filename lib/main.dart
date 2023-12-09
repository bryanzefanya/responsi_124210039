// import 'package:responsi_124210039/Pages/LoginPage.dart';
import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
import 'package:responsi_124210039/Pages/HomePage.dart';
import 'package:responsi_124210039/Pages/MealsPage.dart';
import 'package:responsi_124210039/Pages/DetailPage.dart';
// import 'Models/feedback_model.dart';

void main() async {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MealPages(),
    );
  }
}