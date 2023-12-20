// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'similar_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimilarMovieResponse _$SimilarMovieResponseFromJson(
        Map<String, dynamic> json) =>
    SimilarMovieResponse(
      json['page'] as int?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_pages'] as int?,
      json['total'] as int?,
    );

Map<String, dynamic> _$SimilarMovieResponseToJson(
        SimilarMovieResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.total_pages,
      'total': instance.total_results,
    };
