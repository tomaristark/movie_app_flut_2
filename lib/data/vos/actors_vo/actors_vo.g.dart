// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actors_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorsVO _$ActorsVOFromJson(Map<String, dynamic> json) => ActorsVO(
      json['adult'] as bool,
      json['gender'] as int,
      json['id'] as int,
      (json['known_for'] as List<dynamic>)
          .map((e) => KnownForVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['known_for_department'] as String,
      json['name'] as String,
      (json['popularity'] as num).toDouble(),
      json['profile_path'] as String,
    );

Map<String, dynamic> _$ActorsVOToJson(ActorsVO instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for': instance.known_for,
      'known_for_department': instance.known_for_department,
      'name': instance.name,
      'popularity': instance.popularity,
      'profile_path': instance.profile_path,
    };
