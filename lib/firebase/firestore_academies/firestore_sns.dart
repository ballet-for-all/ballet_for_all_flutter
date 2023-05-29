import 'package:json_annotation/json_annotation.dart';

part 'firestore_sns.g.dart';

@JsonSerializable(explicitToJson: true)
class FirestoreSns {
  FirestoreSns({
    this.kakaoTalk,
    this.naverTalkTalk,
    this.homepage,
    this.naverModoo,
    this.naverBlog,
    this.naverCafe,
    this.instagram,
    this.facebook,
  });

  factory FirestoreSns.fromJson(Map<String, dynamic> json) =>
      _$FirestoreSnsFromJson(json);

  final String? kakaoTalk;
  final String? naverTalkTalk;
  final String? homepage;
  final String? naverModoo;
  final String? naverBlog;
  final String? naverCafe;
  final String? instagram;
  final String? facebook;

  Map<String, dynamic> toJson() => _$FirestoreSnsToJson(this);

  @override
  String toString() =>
      'FirestoreSns{kakaoTalk: $kakaoTalk, naverTalkTalk: $naverTalkTalk, homepage: $homepage, '
      'naverModoo: $naverModoo, naverBlog: $naverBlog, naverCafe: $naverCafe, instagram: $instagram, '
      'facebook: $facebook}';
}
