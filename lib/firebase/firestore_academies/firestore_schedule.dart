import 'package:json_annotation/json_annotation.dart';

part 'firestore_schedule.g.dart';

@JsonSerializable(explicitToJson: true)
class FirestoreSchedule {
  FirestoreSchedule({
    required this.startTime,
    required this.durationInMinutes,
    required this.day,
    required this.teacherName,
  });

  factory FirestoreSchedule.fromJson(Map<String, dynamic> json) =>
      _$FirestoreScheduleFromJson(json);

  final String startTime;
  final int durationInMinutes;
  final String day;
  final String? teacherName;

  Map<String, dynamic> toJson() => _$FirestoreScheduleToJson(this);

  @override
  String toString() =>
      'FirestoreSchedule{startTime: $startTime, durationInMinutes: $durationInMinutes, day: '
      '$day, teacherName: $teacherName}';
}
