import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sportify/constants/firebaseConstants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sportify/models/eventDetailModel.dart';

class DataToFirestore {
  Future<String> addEvent(
      {eventName, date, LatLng location, cat, size, desc, place}) async {
    try {
      final res = await events.add({});
      res.set({
        'name': eventName,
        'date': date,
        'location': GeoPoint(location.latitude, location.longitude),
        'category': cat,
        'size': size,
        'description': desc,
        'active': true,
        'id': res.id,
        'place': place
      });
      return res.id;
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<EventDetailModel> viewEvent(id) async {
    try {
      final res = await events.doc(id).get();
      return EventDetailModel.fromDocumentSnapshot(res);
    } catch (e) {
      return e;
    }
  }

  Future<String> joinEvent() async {
    final res = await joinedEvt.add({
      'evt_id': '',
      'user_id': '',
      'confirmed': false,
      'userDetails': {
        'name': '',
        'phone': '',
        'description': '',
      }
    });
    return 's';
  }

  // Future<bool> checkJoined(docId) async {
  //   final res = await events.doc().get();

  //   // return res;
  // }
}
