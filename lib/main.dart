import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do/layout/home_layout.dart';
import 'package:to_do/shared/styles/myThemeData.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        homeScreen.routeName: (context) => homeScreen(),
      },
      initialRoute: homeScreen.routeName,
      debugShowCheckedModeBanner: false,
      theme: myThemeData.lightTheme,
    );
  }
}
