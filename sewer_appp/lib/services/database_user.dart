import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServiceUser {

  String uid;
  DatabaseServiceUser({ this.uid});


  final CollectionReference infoCollection = Firestore.instance.collection('info');

  Future updateinfo(String FirstName,String LastName, String Email) async{
    return await infoCollection.document(uid).setData({
      'FirstName' : FirstName,
      'LastName' : LastName,
      'Email' : Email,
    });
  }
}