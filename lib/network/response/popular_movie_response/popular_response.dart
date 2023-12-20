
import 'package:json_annotation/json_annotation.dart';

import '../../../data/vos/movie_vo/movie_vo.dart';

part 'popular_response.g.dart';

@JsonSerializable()
class PopularMovieResponse{

  @JsonKey(name: "page")
  final int page;
  
  @JsonKey(name: "results")
  final List<MovieVO> results;
  @JsonKey(name: "total_pages")
  final  int total_pages;
  @JsonKey(name: "total_results")
  final  int total_results;

  PopularMovieResponse(this.page, this.results, this.total_pages, this.total_results);

  factory PopularMovieResponse.fromJson(Map<String,dynamic> json)=> _$PopularMovieResponseFromJson(json);
}