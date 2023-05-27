import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'district.dart';

part 'city.g.dart';

@JsonSerializable(explicitToJson: true)
class City extends Equatable {
  const City({required this.name, required this.districts});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  final String name;
  final List<District> districts;

  Map<String, dynamic> toJson() => _$CityToJson(this);

  @override
  List<Object> get props => [name, districts];
}
