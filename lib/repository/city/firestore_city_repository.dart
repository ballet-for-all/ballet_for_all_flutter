import '../../firebase/firestore_locations/firestore_locations_collection.dart';
import 'city.dart';
import 'city_repository.dart';

class FirestoreCityRepository extends CityRepository {
  FirestoreCityRepository({required this.collection});

  final FirestoreLocationsCollection collection;

  @override
  Future<List<City>> listCities() async {
    final json = await collection.getLocation();
    final citiesJson = json['cities'] as List;
    return citiesJson.map((cityJson) => City.fromJson(cityJson)).toList();
  }
}
