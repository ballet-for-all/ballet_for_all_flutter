import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/city/block.dart';
import '../../../repository/city/city.dart';
import '../../../repository/city/city_repository.dart';
import '../../../repository/city/district.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({
    required this.repository,
  }) : super(const LocationState());

  final CityRepository repository;

  Future<void> initialize() async {
    final loaded = await repository.listCities();
    final cities = loaded.map((city) {
      // District에 전체 옵션 추가
      final blocksOfAllDistricts =
          city.districts.expand((district) => district.blocks).toList();
      final allDistrict = District(
        name: '전체',
        blocks: blocksOfAllDistricts,
      );
      final districts = [allDistrict, ...city.districts]
          // District에서 이름이 빈 경우 제거
          .where((district) => district.name.isNotEmpty)
          // Block에 전체 옵션 추가
          .map((district) {
        final blocks = [const Block(name: '전체'), ...district.blocks];
        return District(
          name: district.name,
          blocks: blocks,
        );
      }).toList();
      return City(
        name: city.name,
        districts: districts,
      );
    }).toList();
    emit(state.copyWith(cities: cities));
  }

  Future<void> selectCity(int i) async {
    final districts = state.cities[i].districts;
    emit(state.copyWith(
      selectedCity: i,
      selectedDistrict: -1,
      selectedBlock: -1,
      districts: districts,
      blocks: [],
    ));
  }

  Future<void> selectDistrict(int i) async {
    final blocks = state.districts[i].blocks;
    emit(state.copyWith(
      selectedDistrict: i,
      selectedBlock: -1,
      blocks: blocks,
    ));
  }

  Future<void> selectBlock(int i) async {
    emit(state.copyWith(
      selectedBlock: i,
    ));
  }
}
