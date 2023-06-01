import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'teacher.g.dart';

@JsonSerializable(explicitToJson: true)
class Teacher extends Equatable {
  const Teacher({
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);

  final String name;
  final String description;
  final String imageUrl;

  Map<String, dynamic> toJson() => _$TeacherToJson(this);

  @override
  List<Object> get props => [name, description, imageUrl];
}
