import 'package:flutter/material.dart';
import 'package:to_do/layout/home_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        homeScreen.routeName:(context) => homeScreen(),
      },
      initialRoute:homeScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}


