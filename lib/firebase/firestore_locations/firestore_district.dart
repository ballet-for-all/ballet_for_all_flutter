import 'package:json_annotation/json_annotation.dart';

import 'firestore_block.dart';

part 'firestore_district.g.dart';

@JsonSerializable(explicitToJson: true)
class FirestoreDistrict {
  FirestoreDistrict({required this.name, required this.blocks});

  factory FirestoreDistrict.fromJson(Map<String, dynamic> json) =>
      _$FirestoreDistrictFromJson(json);

  Map<String, dynamic> toJson() => _$FirestoreDistrictToJson(this);

  final String name;
  final List<FirestoreBlock> blocks;

  @override
  String toString() => 'FirestoreDistrict{name: $name, blocks: $blocks}';
}
