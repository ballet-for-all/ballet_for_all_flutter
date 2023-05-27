import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'block.dart';

part 'district.g.dart';

@JsonSerializable(explicitToJson: true)
class District extends Equatable {
  const District({required this.name, required this.blocks});

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);

  final String name;
  final List<Block> blocks;

  Map<String, dynamic> toJson() => _$DistrictToJson(this);

  @override
  List<Object> get props => [name, blocks];
}
