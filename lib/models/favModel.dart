import 'package:cloud_firestore/cloud_firestore.dart';

class FavModel {
  String userId;
  String eventId;

  FavModel({this.userId, this.eventId});

  FavModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    userId = documentSnapshot["user_id"];
    eventId = documentSnapshot['event_id'];
  }
}
