import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'schedule.dart';

part 'clazz.g.dart';

@JsonSerializable(explicitToJson: true)
class Clazz extends Equatable {
  const Clazz({
    required this.className,
    required this.classTag,
    required this.schedules,
  });

  factory Clazz.fromJson(Map<String, dynamic> json) => _$ClazzFromJson(json);

  final String className;
  final List<int> classTag;
  final List<Schedule> schedules;

  Map<String, dynamic> toJson() => _$ClazzToJson(this);

  @override
  List<Object> get props => [className, classTag, schedules];
}
