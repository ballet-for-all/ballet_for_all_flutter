import 'package:equatable/equatable.dart';

import '../../../repository/city/block.dart';
import '../../../repository/city/city.dart';
import '../../../repository/city/district.dart';

class LocationState extends Equatable {
  const LocationState({
    this.cities = const [],
    this.districts = const [],
    this.blocks = const [],
    this.selectedCity = -1,
    this.selectedDistrict = -1,
    this.selectedBlock = -1,
  });

  final List<City> cities;
  final List<District> districts;
  final List<Block> blocks;
  final int selectedCity;
  final int selectedDistrict;
  final int selectedBlock;

  LocationState copyWith({
    List<City>? cities,
    List<District>? districts,
    List<Block>? blocks,
    int? selectedCity,
    int? selectedDistrict,
    int? selectedBlock,
  }) =>
      LocationState(
        cities: cities ?? this.cities,
        districts: districts ?? this.districts,
        blocks: blocks ?? this.blocks,
        selectedCity: selectedCity ?? this.selectedCity,
        selectedDistrict: selectedDistrict ?? this.selectedDistrict,
        selectedBlock: selectedBlock ?? this.selectedBlock,
      );

  @override
  List<Object> get props => [
        cities,
        districts,
        blocks,
        selectedCity,
        selectedDistrict,
        selectedBlock,
      ];
}
