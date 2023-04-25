import '../../firebase/firestore_locations/firestore_locations_collection.dart';
import 'city.dart';

class CityRepository {
  CityRepository({required this.collection});

  final FirestoreLocationsCollection collection;

  Future<List<City>> listCities() async {
    final json = await collection.getLocation();
    final citiesJson = json['cities'] as List;
    return citiesJson.map((cityJson) => City.fromJson(cityJson)).toList();
  }
}
