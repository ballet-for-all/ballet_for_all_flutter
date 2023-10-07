import 'package:cloud_firestore/cloud_firestore.dart';
import '../../firebase/firestore_collection.dart';
import 'city.dart';

class LocationRepository extends FirestoreCollection {
  Future<List<City>> getLocation() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('location').get();
    final locations =
        snapshot.docs.map((doc) => queryDocumentSnapshotToMap(doc)).toList();
    if (locations.length != 1) {
      throw Exception('Location should be only one.');
    }

    final json = locations.first;
    final citiesJson = json['cities'] as List;
    return citiesJson.map((cityJson) => City.fromJson(cityJson)).toList();
  }
}
