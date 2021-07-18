import 'package:cloud_firestore/cloud_firestore.dart';

class EventsList {
  EventsList({
    this.name,
    this.date,
    this.category,
    this.description,
    this.teamSize,
    this.location,
    this.active,
    this.id,
    this.place,
    this.userId,
    this.prize,
  });

  String name;
  String date;
  String category;
  String description;
  String teamSize;
  GeoPoint location;
  bool active;
  String id;
  String userId;
  String place;
  String prize;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'size': teamSize,
      'date': date,
      'category': category,
      'description': description,
      'active': active,
      'location': location,
      'place': place,
      'user_id': userId,
      'prize': prize
    };
  }

  EventsList.fromFirestore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        userId = firestore['user_id'],
        name = firestore['name'],
        teamSize = firestore['size'],
        date = firestore['date'],
        category = firestore['category'],
        description = firestore['description'],
        active = firestore['active'],
        location = firestore['location'],
        place = firestore['place'],
        prize = firestore['prize'];
}
