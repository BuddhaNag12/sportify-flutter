import 'package:cloud_firestore/cloud_firestore.dart';

class EventDetailModel {
  String category;
  String date;
  String description;
  String name;
  String size;
  GeoPoint location;
  bool active;
  String id;
  String userId;
  String place;

  EventDetailModel({
    this.category,
    this.date,
    this.description,
    this.active,
    this.name,
    this.location,
    this.size,
    this.id,
    this.userId,
    this.place
  });

  EventDetailModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    description = documentSnapshot["description"];
    category = documentSnapshot["category"];
    size = documentSnapshot["size"];
    location = documentSnapshot["location"];
    active = documentSnapshot["active"];
    date = documentSnapshot["date"];
    userId = documentSnapshot["user_id"];
    place =  documentSnapshot["place"];
  }
}
