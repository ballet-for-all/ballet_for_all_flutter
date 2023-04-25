import 'package:json_annotation/json_annotation.dart';

import 'block.dart';

part 'district.g.dart';

@JsonSerializable(explicitToJson: true)
class District {
  District({required this.name, required this.blocks});

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);

  final String name;
  final List<Block> blocks;

  Map<String, dynamic> toJson() => _$DistrictToJson(this);
}
