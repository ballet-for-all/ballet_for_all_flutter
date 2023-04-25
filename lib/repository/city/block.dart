import 'package:json_annotation/json_annotation.dart';

part 'block.g.dart';

@JsonSerializable(explicitToJson: true)
class Block {
  const Block({required this.name});

  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);

  final String name;

  Map<String, dynamic> toJson() => _$BlockToJson(this);
}
