import 'package:equatable/equatable.dart';

class LocationState extends Equatable {
  const LocationState({
    this.cities = const [],
    this.districts = const [],
    this.blocks = const [],
    this.selectedCity = -1,
    this.selectedDistrict = -1,
    this.selectedBlock = -1,
  });

  final List<String> cities;
  final List<String> districts;
  final List<String> blocks;
  final int selectedCity;
  final int selectedDistrict;
  final int selectedBlock;

  LocationState copyWith({
    List<String>? cities,
    List<String>? districts,
    List<String>? blocks,
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
