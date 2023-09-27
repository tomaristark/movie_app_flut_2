// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_genre_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieGenreResponse _$MovieGenreResponseFromJson(Map<String, dynamic> json) =>
    MovieGenreResponse(
      (json['genres'] as List<dynamic>)
          .map((e) => MovieGenreVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieGenreResponseToJson(MovieGenreResponse instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };
