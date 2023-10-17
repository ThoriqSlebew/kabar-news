import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/onboarding.dart';

class splash_screen extends StatelessWidget {
  const splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value){
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder:(context) => onboarding()), (route) => false);
    });
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Image.asset(
              'assets/images/Vector (1).png',
              width: 217 ,
              height: 66,
              fit: BoxFit.contain,
            ),
          )
          ),
    );
  }
}