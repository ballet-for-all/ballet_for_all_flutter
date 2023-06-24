import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'clazz.dart';

part 'timetable.g.dart';

@JsonSerializable(explicitToJson: true)
class Timetable extends Equatable {
  const Timetable({
    required this.timetableName,
    required this.classes,
  });

  factory Timetable.fromJson(Map<String, dynamic> json) =>
      _$TimetableFromJson(json);

  final String? timetableName;
  final List<Clazz> classes;

  Map<String, dynamic> toJson() => _$TimetableToJson(this);

  @override
  List<Object?> get props => [timetableName, classes];
}
