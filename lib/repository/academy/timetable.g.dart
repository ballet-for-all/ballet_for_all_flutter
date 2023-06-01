// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Timetable _$TimetableFromJson(Map<String, dynamic> json) => Timetable(
      timetableName: json['timetableName'] as String?,
      classes: (json['classes'] as List<dynamic>?)
          ?.map((e) => Clazz.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TimetableToJson(Timetable instance) => <String, dynamic>{
      'timetableName': instance.timetableName,
      'classes': instance.classes?.map((e) => e.toJson()).toList(),
    };
