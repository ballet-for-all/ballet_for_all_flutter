import 'package:flutter_bloc/flutter_bloc.dart';

import 'location_state.dart';

// TODO(ghrud92): 실제 데이터 사용
final _tempCities = List.generate(20, (index) => 'City $index');
final _tempDistrict = List.generate(20, (index) => 'District $index');
final _tempBlocks = List.generate(20, (index) => 'Block $index');

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(const LocationState());

  Future<void> initialize() async {
    await loadCities();
    await selectCity(0);
  }

  Future<void> loadCities() async {
    emit(state.copyWith(cities: _tempCities));
  }

  Future<void> selectCity(int i) async {
    emit(state.copyWith(
      selectedCity: i,
      selectedDistrict: -1,
      selectedBlock: -1,
      districts: _tempDistrict,
    ));
  }

  Future<void> selectDistrict(int i) async {
    emit(state.copyWith(
      selectedDistrict: i,
      selectedBlock: -1,
      blocks: _tempBlocks,
    ));
  }

  Future<void> selectBlock(int i) async {
    emit(state.copyWith(
      selectedBlock: i,
    ));
  }
}
