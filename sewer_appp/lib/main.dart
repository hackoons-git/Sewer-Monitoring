import 'package:flutter/material.dart';
import 'package:sewerappp/screens/MapScreen/marker_tap_screen.dart';
import 'package:sewerappp/screens/home_screen.dart';
import 'package:sewerappp/screens/authentication/login_screen.dart';
import 'package:sewerappp/screens//welcome_screen.dart';
import 'package:sewerappp/screens/authentication/registration_screen.dart';
import 'package:sewerappp/screens/complaint_form.dart';

void main()
{
  runApp(Sewer());
}

class Sewer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute:WelcomeScreen.id,
      //if you have initial screen then you cannot have home
      routes: {
        WelcomeScreen.id:(context)=>WelcomeScreen(),
        LoginScreen.id:(context)=>LoginScreen(),
        RegistrationScreen.id:(context)=>RegistrationScreen(),
        HomeScreen.id:(context)=>HomeScreen(),
        ComplaintScreen.id:(context)=>ComplaintScreen(),
      },
    );
  }
}
