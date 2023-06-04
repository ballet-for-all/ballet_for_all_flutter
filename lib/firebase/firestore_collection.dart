import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreCollection {
  Map<String, dynamic> docToMap(QueryDocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return <String, dynamic>{
      ...data,
      'id': doc.id,
    };
  }
}
