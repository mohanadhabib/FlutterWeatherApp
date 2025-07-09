import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AppFirebase {
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
}