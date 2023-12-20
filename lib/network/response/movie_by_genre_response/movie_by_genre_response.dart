import 'package:json_annotation/json_annotation.dart';

import '../../../data/vos/movie_vo/movie_vo.dart';

part 'movie_by_genre_response.g.dart';

@JsonSerializable()
class MovieByGenreResponse{

  @JsonKey(name: "page")
  final int page;
  
  @JsonKey(name: "results")
  final List<MovieVO> results;
  @JsonKey(name: "total_pages")
  final  int total_pages;
  @JsonKey(name: "total_results")
  final  int total_results;

  MovieByGenreResponse(this.page, this.results, this.total_pages, this.total_results);

  factory MovieByGenreResponse.fromJson(Map<String,dynamic> json)=> _$MovieByGenreResponseFromJson(json);
}