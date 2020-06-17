import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AreaInfo extends StatefulWidget {

  static const String id = 'area_info';
  var lst [];
  AreaInfo(this.lst[]);
  @override
  _AreaInfoState createState() => _AreaInfoState(this.lst[]);
}

class _AreaInfoState extends State<AreaInfo> {

  var lst;
  var list = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
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
              onPressed:() {

                },
              icon: Icon(Icons.show_chart),
              label: Text(''),
              )
        ],
      ),

      body: Container(
        child: StaggeredGridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                 child: textField("Display"),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: chart("Water Level"),
              )
            ],
            staggeredTiles: [
              StaggeredTile.extent(2, 150.0),
              StaggeredTile.count(4,50.0)
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
      child: Center(
        child: Text(
          title,
        ),
      ),
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
           /*  Padding(
               padding: EdgeInsets.all(8.0),
               child: Text(
                   title,
                 style: TextStyle(
                  // fontSize: 10.0,
                 ),
               ),
             ),*/
             Padding(
               padding: EdgeInsets.all(14.0),
               child: Sparkline(
                 data: list,
                 lineColor: Colors.blue,
                 pointsMode: PointsMode.all,
                 pointSize: 8.0,
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
