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

  static const String _collectionName = 'locations';
  final CollectionReference<FirestoreLocation> _ref;

  Future<List<FirestoreLocation>> listLocations() async {
    final snapshot = await _ref.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}
