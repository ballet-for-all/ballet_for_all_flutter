// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sns.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sns _$SnsFromJson(Map<String, dynamic> json) => Sns(
      kakaoTalk: json['kakaoTalk'] as String?,
      naverTalkTalk: json['naverTalkTalk'] as String?,
      homepage: json['homepage'] as String?,
      naverModoo: json['naverModoo'] as String?,
      naverBlog: json['naverBlog'] as String?,
      naverCafe: json['naverCafe'] as String?,
      instagram: json['instagram'] as String?,
      facebook: json['facebook'] as String?,
    );

Map<String, dynamic> _$SnsToJson(Sns instance) => <String, dynamic>{
      'kakaoTalk': instance.kakaoTalk,
      'naverTalkTalk': instance.naverTalkTalk,
      'homepage': instance.homepage,
      'naverModoo': instance.naverModoo,
      'naverBlog': instance.naverBlog,
      'naverCafe': instance.naverCafe,
      'instagram': instance.instagram,
      'facebook': instance.facebook,
    };
