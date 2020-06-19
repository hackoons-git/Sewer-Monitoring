import "package:flutter/material.dart";
import 'package:sewerappp/shared/rounded_button.dart';
import 'home_screen.dart';
import 'package:sewerappp/shared/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ComplaintScreen extends StatefulWidget {

  static const String id='complaint_form';
  @override
  _ComplaintScreenState createState() => _ComplaintScreenState();
}
class _ComplaintScreenState extends State<ComplaintScreen> {
  bool loading = false;
  String email;
  String add;
  String error;
  String name;
  String prob;
  int contact;
//  final Function onSaved;
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController t1 = new TextEditingController(text: " ");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: AppBar(

            centerTitle: true,
            title: Text('Swatchta',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.blueGrey,
            elevation: 50.0,
            brightness: Brightness.dark,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top:20.0),
          child: ListView(
            children: <Widget>[
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
                      'Complaint Form',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Name',
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
                        name = value;
                      },
                      validator: (value) =>
                      value.isEmpty
                          ? 'Enter first name '
                          : null,
                      decoration: kTextFileDecoration.copyWith(
                          hintText: 'Enter your first name'),
//                      onSaved: onSaved,
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
                      decoration: kTextFileDecoration.copyWith(
                          hintText: 'email'),
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    Text(
                      'Contact',
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
                        contact = int.parse(value);
                      },
                      validator: (value) =>
                      value.isEmpty
                          ? 'Enter contact'
                          : null,
                      decoration: kTextFileDecoration.copyWith(
                          hintText: 'Enter contact'),
//                      onSaved: onSaved,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      maxLength:5,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration:InputDecoration(hintText: 'Enter a value',
                          helperMaxLines:5,
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),)),
                      validator: (val) =>
                      val.isEmpty
                          ? 'Enter the address '
                          : null,
                      onChanged: (val) {
                        setState(() => add = val);
                      },
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Problem',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(maxLength:5,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration:InputDecoration(hintText: 'Enter a value',
                          helperMaxLines:5,
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),)),
                      validator: (val) =>
                      val.isEmpty
                          ? 'Enter your problem'
                          : null,
                      onChanged: (val) {
                        setState(() => prob = val);
                      },
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    RoundedButton(title: 'Submit', colour: Colors.black,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            //unlike in other olaces this data is being saved in jason format because it is more appropriate according to net
                            await db.collection('complaint').add(toJason()
                            );
                            print("succesufl");
                            showAlertDialog(context);

                          }
                        }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Map<String , dynamic> toJason() =>
      {'address': add,
        'problem':prob,
        'seen':false,
        'name':name,
        'email':email,
        'contact':contact,
      };
  void gettingdata() async {

    await for(var snapshot in db.collection('complaint').snapshots()){

      for(var loc in snapshot.documents) {

        print(loc.data.values.elementAt(0));
        print(loc.data.values.elementAt(1));
        print(loc.data.values.elementAt(2));
        print(loc.data.values.elementAt(2));
        // print(loc['Coordinates'].latitude);
        // print(loc['Coordinates'].longitude);


      }

    }
  }

  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pushNamed(context, HomeScreen.id);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Submitted"),
      content: Column(
        children: <Widget>[

          Text('Name : $name /n'),
          Text('E-mail Id : $email /n'),
          Text('Contact Number : $contact /n' ),
          Text('Address : $add /n '),
          Text('Problem : $prob /n'),
        ],
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}



