// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule(
      startTime: json['startTime'] as String,
      durationInMinutes: json['durationInMinutes'] as int,
      day: json['day'] as String,
      teacherName: json['teacherName'] as String?,
    );

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'startTime': instance.startTime,
      'durationInMinutes': instance.durationInMinutes,
      'day': instance.day,
      'teacherName': instance.teacherName,
    };
