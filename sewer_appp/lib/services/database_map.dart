
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sewerappp/models/area_model.dart';

class DatabaseServiceMap {

  String area ;
  DatabaseServiceMap({this.area});
  final CollectionReference locCollection = Firestore.instance.collection('kashmiri gate');


  //location list from snapshot
  List<SewerInfo> _locationListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return SewerInfo(
        level: doc.data['level'] ?? '',
        id : doc.data['id'] ?? '',
        latitude: doc.data['Coordinates'].latitude,
        longitude: doc.data['Coordinates'].longitude,

      );
    }).toList();
  }

  //get location stream
  Stream<List<SewerInfo> > get location {
    return locCollection.snapshots()
    .map(_locationListFromSnapshot);
  }

}