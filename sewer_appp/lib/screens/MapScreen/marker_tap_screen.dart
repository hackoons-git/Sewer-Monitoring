import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AreaInfo extends StatefulWidget {

  static const String id = 'area_info';
  List<int> lst;
  AreaInfo(this.lst);
  @override
  _AreaInfoState createState() => _AreaInfoState(this.lst);
}

class _AreaInfoState extends State<AreaInfo> {

  var lst;
  var list = [10.0-0.0, 1.0, 1.5, 2.0, 0.0, 0.0,10.0];
  _AreaInfoState(lst);
  void initState(){
    print(lst);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton.icon(
              onPressed:(){

              },
              icon: Icon(Icons.search),
              label: Text('')),
          FlatButton.icon(
              onPressed:() {

                },
              icon: Icon(Icons.show_chart),
              label: Text(''),
              ),

        ],
      ),

      body: Container(
        child: StaggeredGridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
           // primary: true,
            shrinkWrap: true,

            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                 child: textField("Display"),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: chart("Level"),
              )
            ],
            staggeredTiles: [
               StaggeredTile.extent(2,150),
               StaggeredTile.count(2,2)
            ]
        ),
      ),
    );

  }

  Material textField(String title){
    return Material(
      color: Colors.white,
      elevation: 30.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Colors.white,
      child: Column(
           children: <Widget>[
             Padding(
                 padding: EdgeInsets.only(left: 8.0, top: 8.0,right: 18.0),
                 child:Text(
                     'Kashmiri Gate',
                   style: TextStyle(
                     fontSize: 25.0,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
             SizedBox(
               height :10.0
             ),
             Row(
               children: <Widget>[
               Padding(
                 padding: EdgeInsets.only(left:120.0),
                 child: Text(
                   'Level: ',
                   style: TextStyle(
                     fontSize: 20.0
                   ),
                 ),
               ),
                 Padding(
                   padding: EdgeInsets.only(left:10.0),
                   child: Text(
                     '8.0',
                     style:TextStyle (
                      fontSize: 20.0,
                     ),
                   ),
                 )
               ],
             ),
             SizedBox(
               height: 10.0,
             ),
             Row(
               children: <Widget>[
               Padding(
                 padding: EdgeInsets.only(left:120.0),
                 child: Text(
                   'Clog: ',
                   style: TextStyle(
                     fontSize: 20.0
                   ),
                 ),
               ),
                 Padding(
                   padding: EdgeInsets.only(left:10.0),
                   child: Text(
                     'Not Found',
                     style: TextStyle(
                       fontSize: 20.0,
                       color: Colors.green,
                     ),
                   ),
                 )
               ],
             )
          ],
      )
    );
  }

  Material chart(String title){
    return Material(
      color: Colors.white,
      elevation: 30.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Colors.white,
      child: Center(
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Column(
                children:<Widget>[
           Padding(
               padding: EdgeInsets.all(8.0),
               child: Text(
                   title,
                 style: TextStyle(
                   fontSize: 30.0,
                 ),
               ),
             ),
             Padding(
               padding: EdgeInsets.all(14.0),
               child: Sparkline(
                 data: list,
                 lineColor: Colors.blue,
                 pointsMode: PointsMode.all,
                 pointSize: 10.0,
                 pointColor: Colors.brown,
               ),
             )
           ],
         )
    ],
         ),

      ),
    );
  }
}
