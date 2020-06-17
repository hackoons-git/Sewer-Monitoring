import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sewerappp/models/area_model.dart';
import 'package:sewerappp/screens/MapScreen/marker_tap_screen.dart';

class MapMarker extends StatefulWidget {
  @override
  _MapMarkerState createState() => _MapMarkerState();
}

class _MapMarkerState extends State<MapMarker> {

  List<Marker> allMarker = [];
  Completer<GoogleMapController> _controller = Completer();

  var list [];

  void initState(){

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final marker = Provider.of<List<SewerInfo>>(context);
    //print(marker);
    //print(marker.documents);
    // for(var doc in marker.documents)
    // print(doc.data);

    marker.forEach((map)
    {
      //print(map.level);
      print(map.id);
      list.add(map.level);
      //print(map.longitude);
     // print(map.latitude);
      allMarker.add(Marker(
        markerId: MarkerId('myMarkder'),
        draggable: true,
        infoWindow: InfoWindow(
          title: map.id,snippet: map.level.toString(),

        ),
        onTap: () {
          navigateToMarker(list);
        },
        position: LatLng(map.latitude,map.longitude
        ),
       // zIndex: 15.0,
        //flat:true,


      )
      );
    });
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height -50.0,
                    width: double.infinity,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(28.7041,77.1025),
                        zoom: 12.0,

                      ),
                      markers: Set.from(allMarker),
                      onMapCreated: mapController,
                    )
                ),

              ],
            )
          ],
        ),
      ],
    );
  }

  void mapController(GoogleMapController controller){
    _controller.complete(controller);
  }

  void navigateToMarker(var list) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AreaInfo(list);
    }));
  }
}
