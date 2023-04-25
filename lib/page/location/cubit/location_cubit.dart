import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/city/city_repository.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({
    required this.repository,
  }) : super(const LocationState());

  final CityRepository repository;

  Future<void> initialize() async {
    final cities = await repository.listCities();
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
