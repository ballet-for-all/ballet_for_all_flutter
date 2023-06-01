import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'location.dart';
import 'pricing.dart';
import 'sns.dart';
import 'teacher.dart';
import 'timetable.dart';

part 'academy.g.dart';

@JsonSerializable(explicitToJson: true)
class Academy extends Equatable {
  const Academy({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.sns,
    required this.coupon,
    required this.images,
    required this.teachers,
    required this.timetables,
    required this.pricing,
    required this.pricingDescription,
    required this.location,
  });

  factory Academy.fromJson(Map<String, dynamic> json) =>
      _$AcademyFromJson(json);

  final String id;
  final String name;
  final String address;
  final List<String> phone;
  final Sns sns;
  final bool coupon;
  final List<String> images;
  final List<Teacher> teachers;
  final List<Timetable>? timetables;
  final List<Pricing>? pricing;
  final String? pricingDescription;
  final Location location;

  Map<String, dynamic> toJson() => _$AcademyToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        address,
        phone,
        sns,
        coupon,
        images,
        teachers,
        timetables,
        pricing,
        pricingDescription,
        location,
      ];
}
