import 'package:json_annotation/json_annotation.dart';

part 'firestore_academy_location.g.dart';

@JsonSerializable(explicitToJson: true)
class FirestoreAcademyLocation {
  FirestoreAcademyLocation({
    required this.lat,
    required this.lng,
    required this.city,
    required this.district,
    required this.block,
  });

  factory FirestoreAcademyLocation.fromJson(Map<String, dynamic> json) =>
      _$FirestoreAcademyLocationFromJson(json);

  final double lat;
  final double lng;
  final String city;
  final String district;
  final String block;

  Map<String, dynamic> toJson() => _$FirestoreAcademyLocationToJson(this);

  @override
  String toString() =>
      'FirestoreAcademyLocation{lat: $lat, lng: $lng, city: $city, district: $district, '
      'block: $block}';
}
