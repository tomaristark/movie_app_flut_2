// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'known_for_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnownForVO _$KnownForVOFromJson(Map<String, dynamic> json) => KnownForVO(
      json['adult'] as bool,
      json['backdrop_path'] as String,
      (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      json['id'] as int,
      json['media_type'] as String,
      json['original_language'] as String,
      json['original_title'] as String,
      json['overview'] as String,
      json['poster_path'] as String,
      json['release_date'] as String,
      json['title'] as String,
      json['video'] as bool,
      (json['vote_average'] as num).toDouble(),
      json['vote_count'] as int,
    );

Map<String, dynamic> _$KnownForVOToJson(KnownForVO instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdrop_path,
      'genre_ids': instance.genre_ids,
      'id': instance.id,
      'media_type': instance.media_type,
      'original_language': instance.original_language,
      'original_title': instance.original_title,
      'overview': instance.overview,
      'poster_path': instance.poster_path,
      'release_date': instance.release_date,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.vote_average,
      'vote_count': instance.vote_count,
    };
