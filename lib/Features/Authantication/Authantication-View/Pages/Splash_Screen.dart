import 'dart:async';
import 'package:fashion_e_commerce_mobile_app/Core/Colors/Colors.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Strings/Strings.dart';
import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  // SqFlite_Functions Function_SqFlite = SqFlite_Functions();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/Onboarding',(route)=> false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    ScreenWidth = MediaQuery.of(context).size.width;
    ScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text(
            SplashScreenTitle,
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: 20,
        height: 80,
        child: Center(
          child: Text(
            SplashScreenSubTitle,
            style: TextStyle(
              fontSize: 20,
              color: Grey400,
            ),
          ),
        ),
      ),
    );
  }
}
