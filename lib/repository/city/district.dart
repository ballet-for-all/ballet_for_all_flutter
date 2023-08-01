import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'block.dart';

part 'district.g.dart';

@JsonSerializable(explicitToJson: true)
class District extends Equatable {
  const District({required this.name, required this.blocks,this.key = 0});

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);

  final String name;
  final List<Block> blocks;
  final int key;

  Map<String, dynamic> toJson() => _$DistrictToJson(this);

  @override
  List<Object> get props => [name, blocks,key];
}
