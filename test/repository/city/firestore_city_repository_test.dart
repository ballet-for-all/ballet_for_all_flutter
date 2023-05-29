import 'package:ballet_for_all_flutter/firebase/firestore_locations/firestore_locations_collection.dart';
import 'package:ballet_for_all_flutter/repository/city/firestore_city_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../helper/city_generator.dart';
import 'firestore_city_repository_test.mocks.dart';

@GenerateMocks([FirestoreLocationsCollection])
void main() {
  group('FirestoreCityRepository', () {
    group('listCities', () {
      late FirestoreLocationsCollection collection;
      late FirestoreCityRepository repository;

      setUp(() {
        collection = MockFirestoreLocationsCollection();
        repository = FirestoreCityRepository(collection: collection);
      });

      test('FirestoreLocationsCollection에서 가져온 json을 City의 List로 변환한다.',
          () async {
        final city0 = generateCity();
        final city1 = generateCity();
        when(collection.getLocation())
            .thenAnswer((_) async => <String, dynamic>{
                  'cities': [city0.toJson(), city1.toJson()],
                });

        final cities = await repository.listCities();

        expect(cities.length, 2);
        expect(cities[0], city0);
        expect(cities[1], city1);
      });
    });
  });
}
