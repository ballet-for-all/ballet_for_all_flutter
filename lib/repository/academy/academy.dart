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

  // TODO(ghrud92): 유닛 테스트 작성
  int? get minRegularPrice {
    if (pricing == null) {
      return null;
    }
    // 정규 수강권은 주당 수업 수가 null이 아님
    final priceList = pricing!.where((p) => p.numberPerWeek != null);
    if (priceList.isEmpty) {
      return null;
    }
    return priceList
        .map((p) => p.pricePerTime)
        .reduce((min, p) => min < p ? min : p);
  }

  // TODO(ghrud92): 유닛 테스트 작성
  int? get minCouponPrice {
    if (pricing == null) {
      return null;
    }
    // 쿠폰 수강권은 총 횟수가 null이 아니고, -1도 아님
    final priceList =
        pricing!.where((p) => p.totalCount != null && p.totalCount != -1);
    if (priceList.isEmpty) {
      return null;
    }
    return priceList
        .map((p) => p.pricePerTime)
        .reduce((min, p) => min < p ? min : p);
  }

  // '{작품반 이름} 외 {n}편' (ex. 백조의 호수 외 3편)
  String? get pieceClassDescription {
    if (timetables == null) {
      return null;
    }

    final classes = timetables!.map((t) => t.classes).expand((c) => c).toList();
    final pieceClasses = classes.where((c) => c.classTag.contains(6)).toList();
    if (pieceClasses.isEmpty) {
      return null;
    }

    final firstName = pieceClasses.first.className;
    final restCount = pieceClasses.length - 1;
    if (restCount == 0) {
      return firstName;
    }
    return '$firstName 외 $restCount개';
  }
}
