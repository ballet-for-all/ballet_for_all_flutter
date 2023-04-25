import 'package:json_annotation/json_annotation.dart';

import 'firestore_district.dart';

part 'firestore_city.g.dart';

@JsonSerializable(explicitToJson: true)
class FirestoreCity {
  FirestoreCity({required this.name, required this.districts});

  factory FirestoreCity.fromJson(Map<String, dynamic> json) =>
      _$FirestoreCityFromJson(json);

  Map<String, dynamic> toJson() => _$FirestoreCityToJson(this);

  String name;
  List<FirestoreDistrict> districts;

  @override
  String toString() => 'FirestoreCity{name: $name, districts: $districts}';
}
