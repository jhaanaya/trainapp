import 'package:flutter/material.dart';
import 'package:trainapp/pages/welcome_page.dart'; // Replace 'your_app_name' with your actual app name

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dhaka Metro Rail',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.green,
      ),
      home: WelcomePage(),
    );
  }
}
