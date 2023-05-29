// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirestoreSchedule _$FirestoreScheduleFromJson(Map<String, dynamic> json) =>
    FirestoreSchedule(
      startTime: json['startTime'] as String,
      durationInMinutes: json['durationInMinutes'] as int,
      day: json['day'] as String,
      teacherName: json['teacherName'] as String?,
    );

Map<String, dynamic> _$FirestoreScheduleToJson(FirestoreSchedule instance) =>
    <String, dynamic>{
      'startTime': instance.startTime,
      'durationInMinutes': instance.durationInMinutes,
      'day': instance.day,
      'teacherName': instance.teacherName,
    };
