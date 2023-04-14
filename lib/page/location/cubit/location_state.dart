import 'package:equatable/equatable.dart';

class LocationState extends Equatable {
  const LocationState({
    this.cities = const [],
    this.districts = const [],
    this.blocks = const [],
    this.selectedCity,
    this.selectedDistrict,
    this.selectedBlock,
  });

  final List<String> cities;
  final List<String> districts;
  final List<String> blocks;
  final int? selectedCity;
  final int? selectedDistrict;
  final int? selectedBlock;

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
        selectedCity: selectedCity,
        selectedDistrict: selectedDistrict,
        selectedBlock: selectedBlock,
      );

  @override
  List<Object?> get props => [
        cities,
        districts,
        blocks,
        selectedCity,
        selectedDistrict,
        selectedBlock,
      ];
}
