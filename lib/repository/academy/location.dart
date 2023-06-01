import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable(explicitToJson: true)
class Location extends Equatable {
  const Location({
    required this.lat,
    required this.lng,
    required this.city,
    required this.district,
    required this.block,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  final double lat;
  final double lng;
  final String city;
  final String district;
  final String block;

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  List<Object> get props => [lat, lng, city, district, block];
}
