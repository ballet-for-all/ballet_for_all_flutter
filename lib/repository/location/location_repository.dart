import '../../firebase/firestore_locations/firestore_locations_collection.dart';

class LocationRepository {
  LocationRepository({required this.collection});

  final FirestoreLocationsCollection collection;

  Future<void> listCities() async {
    // TODO(ghrud92): Change to list of locations.
    collection.listLocations();
  }
}
