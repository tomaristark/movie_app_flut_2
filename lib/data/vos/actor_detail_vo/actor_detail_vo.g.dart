// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_detail_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorDetailVO _$ActorDetailVOFromJson(Map<String, dynamic> json) =>
    ActorDetailVO(
      json['adult'] as bool,
      (json['also_known_as'] as List<dynamic>).map((e) => e as String).toList(),
      json['biography'] as String,
      json['birthday'] as String,
      json['deathday'] as String?,
      json['gender'] as int,
      json['homepage'] as String?,
      json['id'] as int,
      json['imdb_id'] as String,
      json['known_for_department'] as String,
      json['name'] as String,
      json['place_of_birth'] as String,
      (json['popularity'] as num).toDouble(),
      json['profile_path'] as String,
    );

Map<String, dynamic> _$ActorDetailVOToJson(ActorDetailVO instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'also_known_as': instance.also_known_as,
      'biography': instance.biography,
      'birthday': instance.birthday,
      'deathday': instance.deathday,
      'gender': instance.gender,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdb_id': instance.imdb_id,
      'known_for_department': instance.known_for_department,
      'name': instance.name,
      'place_of_birth': instance.place_of_birth,
      'popularity': instance.popularity,
      'profile_path': instance.profile_path,
    };
