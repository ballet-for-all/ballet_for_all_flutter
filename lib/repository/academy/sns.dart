import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sns.g.dart';

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
}
