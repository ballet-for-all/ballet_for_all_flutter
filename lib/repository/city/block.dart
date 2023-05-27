import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'block.g.dart';

@JsonSerializable(explicitToJson: true)
class Block extends Equatable {
  const Block({required this.name});

  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);

  final String name;

  Map<String, dynamic> toJson() => _$BlockToJson(this);

  @override
  List<Object> get props => [name];
}
