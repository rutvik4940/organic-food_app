
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screen/cart_screen.dart';
import 'package:food_app/screen/splash_screen.dart';
import 'package:food_app/screen/home_screen.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => SplashScreen(),
        "home":(context)=>HomeScreen(),
        "cart":(context)=>CartScreen(),
      },
    ),
  );
}
