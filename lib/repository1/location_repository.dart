import 'package:cloud_firestore/cloud_firestore.dart';
import '../firebase/firestore_collection.dart';
import '../repository/city/city.dart';

 class LocationRepository extends FirestoreCollection{
  
  Future<List<City>> getLocation() async {
    final snapshot = await FirebaseFirestore.instance.collection("location").get();
    final locations = snapshot.docs.map((doc) => docToMap(doc)).toList();
    if (locations.length != 1) {
      throw Exception('Location should be only one.');
    }

    final json = await locations.first;
    final citiesJson = json['cities'] as List;
    return citiesJson.map((cityJson) => City.fromJson(cityJson)).toList();
  }
}