import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sportify/constants/firebaseConstants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:sportify/models/eventModel.dart';

class DataToFirestore {
  Future<String> addEvent(
      {eventName, date, LatLng location, cat, size, desc}) async {
    try {
      final res = await events.add({
        'name': eventName,
        'date': date,
        'location': GeoPoint(location.latitude, location.longitude),
        'category': cat,
        'size': size,
        'description': desc,
        'active': true
      });

      return res.id;
    } catch (e) {
      print(e);
      return e;
    }
  }

  // Future<List<EventModel>> getEventFromFirestore() async {
  //   try {
  //     final res = await events.get();
  //     print(res);
  //     // return res.docs;
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
