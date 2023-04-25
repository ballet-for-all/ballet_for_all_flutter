import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreClient {
  FirestoreClient() : _firestore = FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  FirebaseFirestore get firestore => _firestore;
}
