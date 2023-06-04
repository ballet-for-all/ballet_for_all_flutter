import 'package:cloud_firestore/cloud_firestore.dart';

import '../firestore_client.dart';

class FirestoreLocationsCollection {
  FirestoreLocationsCollection(FirestoreClient client)
      : _ref = client.firestore.collection(_collectionName);

  static const String _collectionName = 'location';
  final CollectionReference<Map<String, dynamic>> _ref;

  /// @return
  /// {
  ///  cities: [
  ///   {
  ///    name: '서울',
  ///    districts: [
  ///     {
  ///      name: '강남구',
  ///      blocks: [
  ///       {
  ///        name: '역삼동'
  ///       },
  ///       ...
  ///      ]
  ///     },
  ///     ...
  ///    ]
  ///   },
  ///   ...
  ///  ]
  /// }
  Future<Map<String, dynamic>> getLocation() async {
    final snapshot = await _ref.get();
    final locations = snapshot.docs.map((doc) => doc.data()).toList();
    if (locations.length != 1) {
      throw Exception('Location should be only one.');
    }
    return locations.first;
  }
}
