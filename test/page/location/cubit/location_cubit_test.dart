import 'package:ballet_for_all_flutter/page/location/cubit/location_cubit.dart';
import 'package:ballet_for_all_flutter/page/location/cubit/location_state.dart';
import 'package:ballet_for_all_flutter/repository/city/block.dart';
import 'package:ballet_for_all_flutter/repository/city/city.dart';
import 'package:ballet_for_all_flutter/repository/city/city_repository.dart';
import 'package:ballet_for_all_flutter/repository/city/district.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'location_cubit_test.mocks.dart';

@GenerateMocks([CityRepository])
void main() {
  group('LocationCubit', () {
    late MockCityRepository cityRepository;

    final List<City> defaultCities = [
      const City(
        name: '서울특별시',
        districts: [
          District(
            name: '강남구',
            blocks: [
              Block(name: '개포동'),
              Block(name: '논현동'),
            ],
          ),
          District(
            name: '강동구',
            blocks: [
              Block(name: '강일동'),
              Block(name: '고덕동'),
            ],
          ),
        ],
      ),
      const City(
        name: '부산광역시',
        districts: [
          District(
            name: '강서구',
            blocks: [
              Block(name: '가덕도동'),
              Block(name: '가락동'),
            ],
          ),
          District(
            name: '금정구',
            blocks: [
              Block(name: '가야동'),
              Block(name: '가락동'),
            ],
          ),
        ],
      ),
    ];

    final List<City> defaultCitiesWithAll = [
      const City(
        name: '서울특별시',
        districts: [
          District(
            name: '전체',
            blocks: [
              Block(name: '전체'),
              Block(name: '개포동'),
              Block(name: '논현동'),
              Block(name: '강일동'),
              Block(name: '고덕동'),
            ],
          ),
          District(
            name: '강남구',
            blocks: [
              Block(name: '전체'),
              Block(name: '개포동'),
              Block(name: '논현동'),
            ],
          ),
          District(
            name: '강동구',
            blocks: [
              Block(name: '전체'),
              Block(name: '강일동'),
              Block(name: '고덕동'),
            ],
          ),
        ],
      ),
      const City(
        name: '부산광역시',
        districts: [
          District(
            name: '전체',
            blocks: [
              Block(name: '전체'),
              Block(name: '가덕도동'),
              Block(name: '가락동'),
              Block(name: '가야동'),
              Block(name: '가락동'),
            ],
          ),
          District(
            name: '강서구',
            blocks: [
              Block(name: '전체'),
              Block(name: '가덕도동'),
              Block(name: '가락동'),
            ],
          ),
          District(
            name: '금정구',
            blocks: [
              Block(name: '전체'),
              Block(name: '가야동'),
              Block(name: '가락동'),
            ],
          ),
        ],
      ),
    ];

    setUp(() {
      EquatableConfig.stringify = true;
      cityRepository = MockCityRepository();
    });

    blocTest<LocationCubit, LocationState>(
      '어떤 함수도 불리지 않았을 때는 기본 location state를 갖는다.',
      build: () => LocationCubit(repository: cityRepository),
      expect: () => [],
      verify: (cubit) {
        expect(cubit.state, const LocationState());
        verifyNever(cityRepository.listCities());
      },
    );

    group('initialize', () {
      blocTest<LocationCubit, LocationState>(
        'repository에서 빈 list를 주면 비어있는 city를 갖는 state를 방출한다.',
        build: () => LocationCubit(repository: cityRepository),
        setUp: () {
          when(cityRepository.listCities()).thenAnswer((_) async => []);
        },
        act: (cubit) async {
          await cubit.initialize();
        },
        expect: () => [
          const LocationState(cities: []),
        ],
        verify: (_) {
          verify(cityRepository.listCities()).called(1);
        },
      );

      blocTest<LocationCubit, LocationState>(
        'repository에서 Exception을 던지면 에러를 던진다.',
        build: () => LocationCubit(repository: cityRepository),
        setUp: () {
          when(cityRepository.listCities()).thenThrow(Exception('error'));
        },
        act: (cubit) async {
          await cubit.initialize();
        },
        errors: () => [isA<Exception>()],
        verify: (_) {
          verify(cityRepository.listCities()).called(1);
        },
      );

      blocTest<LocationCubit, LocationState>(
        'repository에서 준 city 리스트에 "전체" 필드를 추가로 갖는 state를 방출한다.',
        build: () => LocationCubit(repository: cityRepository),
        setUp: () {
          when(cityRepository.listCities())
              .thenAnswer((_) async => defaultCities);
        },
        act: (cubit) async {
          await cubit.initialize();
        },
        expect: () => [
          LocationState(
            cities: defaultCitiesWithAll,
            districts: const [],
            blocks: const [],
            selectedCity: -1,
            selectedDistrict: -1,
            selectedBlock: -1,
          ),
        ],
        verify: (_) {
          verify(cityRepository.listCities()).called(1);
        },
      );
    });

    group('selectCity', () {
      final LocationState defaultState = LocationState(
        cities: defaultCitiesWithAll,
        districts: const [],
        blocks: const [],
        selectedCity: -1,
        selectedDistrict: -1,
        selectedBlock: -1,
      );

      blocTest<LocationCubit, LocationState>(
        '아무것도 선택되지 않은 상태에서 0번째 city가 선택되면, 0번째 city의 district 리스트를 갖는 state를 방출한다.',
        build: () => LocationCubit(repository: cityRepository),
        seed: () => defaultState,
        act: (cubit) async {
          await cubit.selectCity(0);
        },
        expect: () => [
          LocationState(
            cities: defaultCitiesWithAll,
            districts: defaultCitiesWithAll[0].districts,
            blocks: const [],
            selectedCity: 0,
            selectedDistrict: -1,
            selectedBlock: -1,
          ),
        ],
        verify: (_) {
          verifyNever(cityRepository.listCities());
        },
      );

      blocTest<LocationCubit, LocationState>(
        '0번째 city가 선택된 상태에서 1번째 city가 선택되면, 1번째 city의 district 리스트를 갖는 state를 방출한다.',
        build: () => LocationCubit(repository: cityRepository),
        seed: () => defaultState,
        act: (cubit) async {
          await cubit.selectCity(0);
          await cubit.selectCity(1);
        },
        skip: 1,
        expect: () => [
          LocationState(
            cities: defaultCitiesWithAll,
            districts: defaultCitiesWithAll[1].districts,
            blocks: const [],
            selectedCity: 1,
            selectedDistrict: -1,
            selectedBlock: -1,
          ),
        ],
        verify: (_) {
          verifyNever(cityRepository.listCities());
        },
      );

      blocTest<LocationCubit, LocationState>(
        '0번째 city, 0번째 district, 0번째 block이 선택된 상태에서, 1번째 city가 선택되면, 1번째 city의 district 리스트를 갖고, block 리스트와 selectedDistrict, selectedBlock 정보가 초기화된 state를 방출한다.',
        build: () => LocationCubit(repository: cityRepository),
        seed: () => LocationState(
          cities: defaultCitiesWithAll,
          districts: defaultCitiesWithAll[0].districts,
          blocks: defaultCitiesWithAll[0].districts[0].blocks,
          selectedCity: 0,
          selectedDistrict: 0,
          selectedBlock: 0,
        ),
        act: (cubit) async {
          await cubit.selectCity(1);
        },
        expect: () => [
          LocationState(
            cities: defaultCitiesWithAll,
            districts: defaultCitiesWithAll[1].districts,
            blocks: const [],
            selectedCity: 1,
            selectedDistrict: -1,
            selectedBlock: -1,
          ),
        ],
        verify: (_) {
          verifyNever(cityRepository.listCities());
        },
      );
    });

    group('selectDistrict', () {
      final LocationState defaultState = LocationState(
        cities: defaultCitiesWithAll,
        districts: defaultCitiesWithAll[0].districts,
        blocks: const [],
        selectedCity: 0,
        selectedDistrict: -1,
        selectedBlock: -1,
      );

      blocTest<LocationCubit, LocationState>(
        '아무것도 선택되지 않은 상태에서 0번째 district가 선택되면, 0번째 district의 block 리스트를 갖는 state를 방출한다.',
        build: () => LocationCubit(repository: cityRepository),
        seed: () => defaultState,
        act: (cubit) async {
          await cubit.selectDistrict(0);
        },
        expect: () => [
          LocationState(
            cities: defaultCitiesWithAll,
            districts: defaultCitiesWithAll[0].districts,
            blocks: defaultCitiesWithAll[0].districts[0].blocks,
            selectedCity: 0,
            selectedDistrict: 0,
            selectedBlock: -1,
          ),
        ],
        verify: (_) {
          verifyNever(cityRepository.listCities());
        },
      );

      blocTest<LocationCubit, LocationState>(
        '0번째 district가 선택된 상태에서 1번째 district가 선택되면, 1번째 district의 block 리스트를 갖는 state를 방출한다.',
        build: () => LocationCubit(repository: cityRepository),
        seed: () => defaultState,
        act: (cubit) async {
          await cubit.selectDistrict(0);
          await cubit.selectDistrict(1);
        },
        skip: 1,
        expect: () => [
          LocationState(
            cities: defaultCitiesWithAll,
            districts: defaultCitiesWithAll[0].districts,
            blocks: defaultCitiesWithAll[0].districts[1].blocks,
            selectedCity: 0,
            selectedDistrict: 1,
            selectedBlock: -1,
          ),
        ],
        verify: (_) {
          verifyNever(cityRepository.listCities());
        },
      );

      blocTest<LocationCubit, LocationState>(
        '0번째 city, 0번째 district, 0번째 block이 선택된 상태에서, 1번째 district가 선택되면, 1번째 district 리스트를 갖고, block 리스트와 selectedBlock 정보가 초기화된 state를 방출한다.',
        build: () => LocationCubit(repository: cityRepository),
        seed: () => LocationState(
          cities: defaultCitiesWithAll,
          districts: defaultCitiesWithAll[0].districts,
          blocks: defaultCitiesWithAll[0].districts[0].blocks,
          selectedCity: 0,
          selectedDistrict: 0,
          selectedBlock: 0,
        ),
        act: (cubit) async {
          await cubit.selectDistrict(1);
        },
        expect: () => [
          LocationState(
            cities: defaultCitiesWithAll,
            districts: defaultCitiesWithAll[0].districts,
            blocks: defaultCitiesWithAll[0].districts[1].blocks,
            selectedCity: 0,
            selectedDistrict: 1,
            selectedBlock: -1,
          ),
        ],
        verify: (_) {
          verifyNever(cityRepository.listCities());
        },
      );
    });

    group('selectBlock', () {
      final LocationState defaultState = LocationState(
        cities: defaultCitiesWithAll,
        districts: defaultCitiesWithAll[0].districts,
        blocks: defaultCitiesWithAll[0].districts[0].blocks,
        selectedCity: 0,
        selectedDistrict: 0,
        selectedBlock: -1,
      );

      blocTest<LocationCubit, LocationState>(
        '아무것도 선택되지 않은 상태에서 0번째 block이 선택되면, 0번째 block의 state를 방출한다.',
        build: () => LocationCubit(repository: cityRepository),
        seed: () => defaultState,
        act: (cubit) async {
          await cubit.selectBlock(0);
        },
        expect: () => [
          LocationState(
            cities: defaultCitiesWithAll,
            districts: defaultCitiesWithAll[0].districts,
            blocks: defaultCitiesWithAll[0].districts[0].blocks,
            selectedCity: 0,
            selectedDistrict: 0,
            selectedBlock: 0,
          ),
        ],
        verify: (_) {
          verifyNever(cityRepository.listCities());
        },
      );

      blocTest<LocationCubit, LocationState>(
        '0번째 block이 선택된 상태에서 1번째 block이 선택되면, 1번째 block의 state를 방출한다.',
        build: () => LocationCubit(repository: cityRepository),
        seed: () => defaultState,
        act: (cubit) async {
          await cubit.selectBlock(0);
          await cubit.selectBlock(1);
        },
        skip: 1,
        expect: () => [
          LocationState(
            cities: defaultCitiesWithAll,
            districts: defaultCitiesWithAll[0].districts,
            blocks: defaultCitiesWithAll[0].districts[0].blocks,
            selectedCity: 0,
            selectedDistrict: 0,
            selectedBlock: 1,
          ),
        ],
        verify: (_) {
          verifyNever(cityRepository.listCities());
        },
      );
    });
  });
}
