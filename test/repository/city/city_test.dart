import 'package:ballet_for_all_flutter/repository/city/city.dart';
import 'package:ballet_for_all_flutter/repository/city/district.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helper/district_generator.dart';

void main() {
  group('City', () {
    group('toJson', () {
      test('City 객체는 json Map으로 변환된다', () {
        final districts = [generateDistrict(), generateDistrict()];
        final city = City(
          name: 'city_name',
          districts: districts,
        );

        expect(city.toJson(), {
          'name': 'city_name',
          'districts': districts.map((district) => district.toJson()).toList(),
        });
      });
    });

    group('fromJson', () {
      test('name, districts 필드가 있는 Map 객체는 City 객체로 변환된다', () {
        const Map<String, dynamic> json = {
          'name': 'city_name',
          'districts': [
            {'name': 'district0', 'blocks': []},
            {'name': 'district1', 'blocks': []},
          ],
        };

        const expected = City(
          name: 'city_name',
          districts: [
            District(name: 'district0', blocks: []),
            District(name: 'district1', blocks: []),
          ],
        );
        expect(City.fromJson(json), expected);
      });

      test('name 필드가 없는 Map 객체는 Error를 던진다', () {
        const Map<String, dynamic> json = {
          'districts': [
            {'name': 'district0', 'blocks': []},
            {'name': 'district1', 'blocks': []},
          ]
        };

        // NOTE: 실제 에러는 _CastError 지만 그건 잡아낼 수 없기에 Error로 확인한다.
        expect(() => City.fromJson(json), throwsA(isA<Error>()));
      });

      test('districts 필드가 없는 Map 객체는 Error를 던진다', () {
        const Map<String, dynamic> json = {
          'name': 'city_name',
        };

        // NOTE: 실제 에러는 _CastError 지만 그건 잡아낼 수 없기에 Error로 확인한다.
        expect(() => City.fromJson(json), throwsA(isA<Error>()));
      });

      test('districts 필드가 List가 아닌 Map 객체는 Error를 던진다', () {
        const Map<String, dynamic> json = {
          'name': 'city_name',
          'districts': {},
        };

        // NOTE: 실제 에러는 _CastError 지만 그건 잡아낼 수 없기에 Error로 확인한다.
        expect(() => City.fromJson(json), throwsA(isA<Error>()));
      });

      test('name, districts 필드가 있는 Map 객체는 City 객체로 변환된다', () {
        const Map<String, dynamic> json = {
          'name': 'city_name',
          'districts': [
            {'name': 'district0', 'blocks': []},
            {'name': 'district1', 'blocks': []},
          ],
        };

        const expected = City(
          name: 'city_name',
          districts: [
            District(name: 'district0', blocks: []),
            District(name: 'district1', blocks: []),
          ],
        );
        expect(City.fromJson(json), expected);
      });

      test('추가적인 필드가 있는 Map 객체는 City 객체로 변환된다', () {
        const Map<String, dynamic> json = {
          'name': 'city_name',
          'districts': [
            {'name': 'district0', 'blocks': []},
            {'name': 'district1', 'blocks': []},
          ],
          'additional': 'additional',
        };

        const expected = City(
          name: 'city_name',
          districts: [
            District(name: 'district0', blocks: []),
            District(name: 'district1', blocks: []),
          ],
        );
        expect(City.fromJson(json), expected);
      });
    });
  });
}
