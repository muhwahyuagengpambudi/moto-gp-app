import 'package:flutter/material.dart';
import 'package:moto_gp_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'moto_gp_app',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
