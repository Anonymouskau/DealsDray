// main.dart
import 'package:dealsdray/MainPage.dart';
import 'package:dealsdray/home.dart';
import 'package:dealsdray/otp.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import 'login.dart';

 void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Routes Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/':(context) => HomeScreen(),
        '/login': (context) => DetailsScreen(),
        '/register':(context)=>Otp(),
        '/mainPage':(context)=>Mainpage()
      },
      initialRoute: '/',
    );
  }
}
