import 'city.dart';

abstract class CityRepository {
  Future<List<City>> listCities();
}
