// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_timetable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirestoreTimetable _$FirestoreTimetableFromJson(Map<String, dynamic> json) =>
    FirestoreTimetable(
      timetableName: json['timetableName'] as String?,
      classes: (json['classes'] as List<dynamic>?)
          ?.map((e) => FirestoreClass.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FirestoreTimetableToJson(FirestoreTimetable instance) =>
    <String, dynamic>{
      'timetableName': instance.timetableName,
      'classes': instance.classes?.map((e) => e.toJson()).toList(),
    };
