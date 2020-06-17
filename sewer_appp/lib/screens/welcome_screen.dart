import 'package:flutter/material.dart';
import 'package:sewerappp/shared/rounded_button.dart';
import 'package:sewerappp/screens/authentication/login_screen.dart';
import 'package:sewerappp/screens/authentication/registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id= 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/finalwater.png"), fit: BoxFit.cover)),
      child: Scaffold(
       backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      //color: Colors.black12,
                      child: Image.asset('images/manholecoverb.png'),
                      height: 200.0,
                    ),
                    SizedBox(
                      width:10.0,
                    ),
                    Text(
                      'Swatchta ',
                      style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 48.0,
                ),
                RoundedButton(title:'Log-In',colour:Colors.black54 ,onPressed: ()
                {Navigator.pushNamed(context, LoginScreen.id);
                  //Go to login screen.
                },),
                RoundedButton(title:'Register',colour: Colors.black87,onPressed:()
                {Navigator.pushNamed(context, RegistrationScreen.id);
                  //Go to login screen.
                }, ),
              ],
            ),
          ],
          ),
        ),
      ),
    );
  }
}
