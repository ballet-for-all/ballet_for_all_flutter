import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sns.g.dart';

enum SnsType {
  kakaoTalk,
  naverTalkTalk,
  homepage,
  naverModoo,
  naverBlog,
  naverCafe,
  instagram,
  facebook,
}

typedef SnsEntry = MapEntry<SnsType, String>;

@JsonSerializable(explicitToJson: true)
class Sns extends Equatable {
  const Sns({
    this.kakaoTalk,
    this.naverTalkTalk,
    this.homepage,
    this.naverModoo,
    this.naverBlog,
    this.naverCafe,
    this.instagram,
    this.facebook,
  });

  factory Sns.fromJson(Map<String, dynamic> json) => _$SnsFromJson(json);

  final String? kakaoTalk;
  final String? naverTalkTalk;
  final String? homepage;
  final String? naverModoo;
  final String? naverBlog;
  final String? naverCafe;
  final String? instagram;
  final String? facebook;

  Map<String, dynamic> toJson() => _$SnsToJson(this);

  @override
  List<Object?> get props => [
        kakaoTalk,
        naverTalkTalk,
        homepage,
        naverModoo,
        naverBlog,
        naverCafe,
        instagram,
        facebook,
      ];

  List<SnsEntry> get sortedSnsEntries {
    final sorted = <SnsEntry>[];

    if (kakaoTalk != null) {
      sorted.add(MapEntry(SnsType.kakaoTalk, kakaoTalk!));
    }
    if (instagram != null) {
      sorted.add(MapEntry(SnsType.instagram, instagram!));
    }
    if (homepage != null) {
      sorted.add(MapEntry(SnsType.homepage, homepage!));
    }
    if (naverBlog != null) {
      sorted.add(MapEntry(SnsType.naverBlog, naverBlog!));
    }
    if (naverCafe != null) {
      sorted.add(MapEntry(SnsType.naverCafe, naverCafe!));
    }
    // TODO(ghrud92): 나머지 SNS 추가

    return sorted;
  }
}
