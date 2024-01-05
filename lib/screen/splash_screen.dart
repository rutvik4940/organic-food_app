import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
    void initState() {
      super.initState();
      Future.delayed( const Duration(seconds:3),() => Navigator.pushReplacementNamed(context, 'home'));
    }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/original-7c5ce30318300438846586b00734a1cf.png"),
          ],
        ),
      ),
    );
  }
}
