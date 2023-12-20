// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_by_genre_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieByGenreResponse _$MovieByGenreResponseFromJson(
        Map<String, dynamic> json) =>
    MovieByGenreResponse(
      json['page'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_pages'] as int,
      json['total_results'] as int,
    );

Map<String, dynamic> _$MovieByGenreResponseToJson(
        MovieByGenreResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.total_pages,
      'total_results': instance.total_results,
    };
