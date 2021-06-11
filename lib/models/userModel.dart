import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String email;
  String name;
  String role;

  UserModel({this.uid, this.email, this.name, this.role});

  UserModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    uid = documentSnapshot['uid'];
    name = documentSnapshot["name"];
    email = documentSnapshot["email"];
    role = documentSnapshot["role"];
  }
}
