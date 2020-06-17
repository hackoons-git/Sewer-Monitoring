import 'package:flutter/material.dart';
import 'package:sewerappp/shared/rounded_button.dart';
import 'package:sewerappp/shared/components.dart';
import 'package:sewerappp/services/auth.dart';
import 'package:sewerappp/screens/home_screen.dart';
import 'package:sewerappp/shared/loading.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id='registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {


  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email;
  String password;
  String password2;
  String error;
  String firstName;
  String LastName;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children : <Widget> [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'First Name',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      //Do something with the user input.
                      firstName = value;
                    },
                    validator: (value) => value.isEmpty ? 'Enter first name ': null,
                    decoration: kTextFileDecoration.copyWith(hintText: 'Enter your first name'),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Last Name',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      //Do something with the user input.
                      LastName = value;
                    },
                    validator: (value) => value.isEmpty ? 'Enter last name ': null,
                    decoration: kTextFileDecoration.copyWith(hintText: 'Enter your last name'),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Email Address',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    decoration: kTextFileDecoration.copyWith(hintText: 'email'),
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    decoration: kTextFileDecoration.copyWith(hintText: 'password'),
                    obscureText: true,
                    validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Confirm Password',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      password2 = value;
                      //Do something with the user input.
                    },
                    obscureText: true,
                    validator: (val){
                      if(val.isEmpty)
                        return 'confirm your password';
                      if(password2 != password)
                        return 'Those passwords didn\'t match. Try again';
                    },
                    decoration:  kTextFileDecoration.copyWith(hintText:'Confirm your password'),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  RoundedButton(title: 'Register',colour: Colors.black,
                      onPressed: () async {
                        if(_formKey.currentState.validate()){
                          setState(() => loading = true);
                          dynamic result = await _auth.registerWithEmailAndPassword(email, password,firstName,LastName);

                          if(result == null) {
                            setState(() {
                              loading = false;
                              error = 'Please supply a valid email';
                            });

                          }
                          else {
                            print("succesufl");
                            Navigator.pushNamed(context, HomeScreen.id);
                          }
                        }
                      }
                      ),
                ],
              ),
            ),
        ],
          ),
        ),
      );
  }
}