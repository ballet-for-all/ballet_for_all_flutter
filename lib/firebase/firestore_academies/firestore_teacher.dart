import 'package:json_annotation/json_annotation.dart';

part 'firestore_teacher.g.dart';

@JsonSerializable(explicitToJson: true)
class FirestoreTeacher {
  FirestoreTeacher({
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory FirestoreTeacher.fromJson(Map<String, dynamic> json) =>
      _$FirestoreTeacherFromJson(json);

  final String name;
  final String description;
  final String imageUrl;

  Map<String, dynamic> toJson() => _$FirestoreTeacherToJson(this);

  @override
  String toString() =>
      'FirestoreTeacher{name: $name, description: $description, imageUrl: $imageUrl}';
}
