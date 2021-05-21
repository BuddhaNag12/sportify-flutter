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

  EventDetailModel({
    this.category,
    this.date,
    this.description,
    this.active,
    this.name,
    this.location,
    this.size,
    this.id,
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
  }
}
