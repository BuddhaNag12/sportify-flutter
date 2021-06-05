 
 
 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore fireStore = FirebaseFirestore.instance;
final CollectionReference events = fireStore.collection('events');
final CollectionReference authUsers = fireStore.collection('users');
final CollectionReference joinedEvt = fireStore.collection('joinees');