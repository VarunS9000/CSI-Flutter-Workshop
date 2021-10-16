import 'package:csi_workshop/congragulations.dart';
import 'package:csi_workshop/registration_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes:{
      '/home':(context)=> const RegistrationScreen(),
      '/congratulations':(context)=> CongratulationScreen()
    }
    
  ));
}

