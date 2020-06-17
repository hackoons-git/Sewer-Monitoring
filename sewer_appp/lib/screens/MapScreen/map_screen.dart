import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sewerappp/models/area_model.dart';
import 'package:sewerappp/screens/MapScreen/marker_fetch.dart';
import 'package:sewerappp/services/auth.dart';
import 'package:sewerappp/services/database_map.dart';
import 'package:provider/provider.dart';



class MapScreen extends StatefulWidget {

  static const String id='map_screen';
  final String area;

  MapScreen(this.area);

  @override
  _MapScreenState createState() => _MapScreenState(this.area);
}

class _MapScreenState extends State<MapScreen> {


  String area;
  _MapScreenState(this.area);

  final AuthService _auth = AuthService();
  final _firestore = Firestore.instance;




  @override

  Widget build(BuildContext context){
    return WillPopScope(


        onWillPop: () {
          // Write some code to control things, when user press Back navigation button in device navigationBar
          moveToLastScreen();
        },

        child: StreamProvider<List<SewerInfo>>.value(
          value: DatabaseServiceMap().location,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(
                double.infinity, 75,
              ),
              child: AppBar(

                centerTitle: true,
                title:Text(' New Delhi',
                  style: TextStyle(
                    color: Colors.black,
                  ),) ,
                backgroundColor: Colors.blueGrey,
                elevation: 50.0,
                brightness: Brightness.dark,
                actions: <Widget>[
                  FlatButton.icon(
                    icon: Icon(Icons.search),
                    label: Text(''),
                    onPressed:() {

                    },
                  )
                ],
              ),
            ),

            body: MapMarker(),

          ),
        )
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }




}


