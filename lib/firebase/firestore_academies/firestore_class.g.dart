// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirestoreClass _$FirestoreClassFromJson(Map<String, dynamic> json) =>
    FirestoreClass(
      className: json['className'] as String,
      classTag: json['classTag'] as int,
      schedules: (json['schedules'] as List<dynamic>)
          .map((e) => FirestoreSchedule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FirestoreClassToJson(FirestoreClass instance) =>
    <String, dynamic>{
      'className': instance.className,
      'classTag': instance.classTag,
      'schedules': instance.schedules.map((e) => e.toJson()).toList(),
    };
