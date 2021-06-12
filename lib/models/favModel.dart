import 'package:cloud_firestore/cloud_firestore.dart';

class FavModel {
  String userId;
  List eventIds;

  FavModel({this.userId, this.eventIds});

  FavModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    userId = documentSnapshot["user_id"];
    eventIds = documentSnapshot['evt_favs'];
  }
}
