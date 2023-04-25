import 'package:cloud_firestore/cloud_firestore.dart';

import '../firestore_client.dart';
import 'firestore_location.dart';

class FirestoreLocationsCollection {
  FirestoreLocationsCollection(FirestoreClient client)
      : _ref = client.firestore
            .collection(_collectionName)
            .withConverter<FirestoreLocation>(
              fromFirestore: FirestoreLocation.fromFirestore,
              toFirestore: (firestoreLocation, options) =>
                  firestoreLocation.toFirestore(),
            );

  static const String _collectionName = 'location';
  final CollectionReference<FirestoreLocation> _ref;

  Future<Map<String, dynamic>> getLocation() async {
    final snapshot = await _ref.get();
    final locations = snapshot.docs.map((doc) => doc.data()).toList();
    if (locations.length != 1) {
      throw Exception('Location should be only one.');
    }
    return locations.first.toJson();
  }
}
