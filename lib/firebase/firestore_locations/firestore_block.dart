import 'package:json_annotation/json_annotation.dart';

part 'firestore_block.g.dart';

@JsonSerializable(explicitToJson: true)
class FirestoreBlock {
  FirestoreBlock({required this.name});

  factory FirestoreBlock.fromJson(Map<String, dynamic> json) =>
      _$FirestoreBlockFromJson(json);

  Map<String, dynamic> toJson() => _$FirestoreBlockToJson(this);

  final String name;

  @override
  String toString() => 'FirestoreBlock{name: $name}';
}
