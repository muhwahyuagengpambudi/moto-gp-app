import 'dart:async';
import 'package:flutter/material.dart';
import 'package:moto_gp_app/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    timerSS();
  }

  //timer
  timerSS() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return HomePage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(23, 28, 33, 1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/moto_gp1.png',
                width: 545,
                height: 545,
              ),
              // Image.asset(
              //   'images/moto_gp.png',
              //   width: 200,
              //   height: 200,
              // ),
            ],
          ),
        ));
  }
}
