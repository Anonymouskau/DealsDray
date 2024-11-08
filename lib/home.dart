import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:dealsdray/login.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  late Timer _timer;
  
  String deviceDetails = "Fetching device info...";
  
  @override
  void initState() {
    
    
    super.initState();
    
       
    
    // Start a timer that triggers every 1 second
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _counter++;
       
     
      });

    });
    

  }
  
  
  @override
  Widget build(BuildContext context) {
    
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color.fromARGB(248, 254, 251, 251),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              
              Image(
                height: deviceHeight-100,
                image: const AssetImage('assets/images/loadscreen.jpeg'),
              ),
              
            _counter<20?CircularProgressIndicator(color: Color.fromRGBO(255, 0, 0, 1),)
            :DetailsScreen()],
          ),
        ));
  }
}
