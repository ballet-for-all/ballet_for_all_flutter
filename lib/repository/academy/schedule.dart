import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule.g.dart';

@JsonSerializable(explicitToJson: true)
class Schedule extends Equatable {
  const Schedule({
    required this.startTime,
    required this.durationInMinutes,
    required this.day,
    required this.teacherName,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  final String startTime;
  final int durationInMinutes;
  final String day;
  final String? teacherName;

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);

  @override
  List<Object?> get props => [startTime, durationInMinutes, day, teacherName];

  int get startHour => int.parse(startTime.split(':')[0]);

  int get startMinutes => int.parse(startTime.split(':')[1]);

  String get endTime {
    final endHour =
        startHour + ((startMinutes + durationInMinutes) / 60).floor();
    final endMinutes = (startMinutes + durationInMinutes) % 60;
    return '$endHour:$endMinutes';
  }
}
