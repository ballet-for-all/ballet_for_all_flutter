import 'package:cloud_firestore/cloud_firestore.dart';

import '../firestore_client.dart';
import 'firestore_academy.dart';

class FirestoreAcademiesCollection {
  FirestoreAcademiesCollection(FirestoreClient client)
      : _ref = client.firestore
            .collection(_collectionName)
            .withConverter<FirestoreAcademy>(
              fromFirestore: FirestoreAcademy.fromFirestore,
              toFirestore: (firestoreAcademy, options) =>
                  firestoreAcademy.toFirestore(),
            );

  static const String _collectionName = 'academies';
  final CollectionReference<FirestoreAcademy> _ref;

  Future<List<Map<String, dynamic>>> getAcademies() async {
    final snapshot = await _ref.get();
    final academies = snapshot.docs.map((doc) => doc.data()).toList();

    return academies.map((academy) => academy.toJson()).toList();
  }
}
