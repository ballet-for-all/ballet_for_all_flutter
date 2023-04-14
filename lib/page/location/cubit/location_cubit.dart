import 'package:flutter_bloc/flutter_bloc.dart';

import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  // TODO(kimhokyung): 실제 데이터를 다루는 Repository 추가
  LocationCubit() : super(const LocationState());

  Future<void> initialize() async {
    await loadCities();
    await selectCity(0);
    await selectDistrict(0);
  }

  Future<void> loadCities() async {
    emit(state.copyWith(cities: ['City 1', 'City 2', 'City 3']));
  }

  Future<void> selectCity(int i) async {
    emit(state.copyWith(
      selectedCity: i,
      districts: ['District 1', 'District 2', 'District 3'],
    ));
  }

  Future<void> selectDistrict(int i) async {
    emit(state.copyWith(
      selectedDistrict: i,
      blocks: ['Block 1', 'Block 2', 'Block 3'],
    ));
  }

  Future<void> selectBlock(int i) async {
    emit(state.copyWith(selectedBlock: i));
  }
}
