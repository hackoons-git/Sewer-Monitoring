import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sewerappp/screens/MapScreen/map_screen.dart';
import 'package:sewerappp/screens/welcome_screen.dart';
import 'package:sewerappp/services/auth.dart';
import 'package:sewerappp/shared/components.dart';
import 'package:sewerappp/shared/rounded_button.dart';


class HomeScreen extends StatefulWidget {

  static const String id='home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final AuthService _auth = AuthService();
  final TextEditingController t1 = new TextEditingController(text: " ");

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: AppBar(

            centerTitle: true,
            title:Text('Swatchta',
            style: TextStyle(
              color: Colors.black,
             ),
            ) ,
            backgroundColor: Colors.blueGrey,
            elevation: 50.0,
              actions: <Widget>[
                FlatButton.icon(
                         icon: Icon(Icons.person),
                        label: Text('logout'),
                        onPressed: () async {
                               // await _auth.signOut();
                             Navigator.pushNamed(context, WelcomeScreen.id);
                          },
                ),
              ],
            brightness: Brightness.dark,
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[

              UserAccountsDrawerHeader(
                decoration:BoxDecoration(
                  color: Colors.black87,
                ),
                accountName: Text("Prerna Semwal"),
                accountEmail: Text("prernasemwal1998@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                  Theme.of(context).platform == TargetPlatform.iOS
                      ? Colors.black
                      : Colors.white,
                  child: Text(
                    "P",
                    //have to add here the first alphabet of the account name
                    style: TextStyle(fontSize: 40.0,
                      color:Colors.black,),
                  ),
                ),
              ),

              ListTile(
                title: Text('Home',style: TextStyle(fontSize: 15.0,
                  color:Colors.black,),),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Contact',style: TextStyle(fontSize: 15.0,
                  color:Colors.black,),),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Settings',style: TextStyle(fontSize: 15.0,
                  color:Colors.black,),),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        body:Padding(
          padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 100.0),
          child: ListView(
            children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Enter area you want to search ",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextField(
                  controller: t1,
                  decoration:  kTextFileDecoration.copyWith(hintText:'Enter Area'),
                ),

                SizedBox(
                  height: 30.0,
                ),
                RoundedButton(
                  title: "Search",
                  colour: Colors.black,
                  onPressed: (){
                  //   print(t1.text);
                   navigateToDetail(t1.text);

                  },

                ),
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }


  void navigateToDetail(String area) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MapScreen(area);
    }));
  }


}
