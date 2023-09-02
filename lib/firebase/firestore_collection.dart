import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreCollection {
  Map<String, dynamic> queryDocumentSnapshotToMap(QueryDocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return <String, dynamic>{
      ...data,
      'id': doc.id,
    };
  }

  Map<String, dynamic> documentSnapshotToMap(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return <String, dynamic>{
      ...data,
      'id': doc.id,
    };
  }
}
