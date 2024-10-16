import 'package:dailyskincare/screens/get_started.dart';
import 'package:flutter/material.dart';
// import 'package:dailyskincare/screens/get_started.dart';
// import 'package:dailyskincare/widget/bottom_bar.dart'; // Import your BottomBar widget

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const GetStarted(),  // Set the BottomBar as the home widget
    );
  }
}
