// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clazz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Clazz _$ClazzFromJson(Map<String, dynamic> json) => Clazz(
      className: json['className'] as String,
      classTag:
          (json['classTag'] as List<dynamic>).map((e) => e as int).toList(),
      schedules: (json['schedules'] as List<dynamic>)
          .map((e) => Schedule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClazzToJson(Clazz instance) => <String, dynamic>{
      'className': instance.className,
      'classTag': instance.classTag,
      'schedules': instance.schedules.map((e) => e.toJson()).toList(),
    };
