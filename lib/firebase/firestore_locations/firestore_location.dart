import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import 'firestore_city.dart';

part 'firestore_location.g.dart';

@JsonSerializable()
class FirestoreLocation {
  FirestoreLocation({
    required this.id,
    required this.cities,
  });

  factory FirestoreLocation.fromJson(Map<String, dynamic> json) =>
      _$FirestoreLocationFromJson(json);

  factory FirestoreLocation.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    if (data == null) {
      throw Exception('FirestoreLocation is null');
    }
    return FirestoreLocation.fromJson({
      'id': snapshot.id,
      ...data,
    });
  }

  final String id;
  final List<FirestoreCity> cities;

  Map<String, dynamic> toJson() => _$FirestoreLocationToJson(this);

  Map<String, dynamic> toFirestore() => {'cities': cities};

  @override
  String toString() => 'FirestoreLocation{id: $id, cities: $cities}';
}
