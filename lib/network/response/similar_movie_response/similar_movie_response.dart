
import 'package:json_annotation/json_annotation.dart';

import '../../../data/vos/movie_vo/movie_vo.dart';

part 'similar_movie_response.g.dart';

@JsonSerializable()
class SimilarMovieResponse{
  @JsonKey(name: "page")
  final int ? page;
  @JsonKey(name: "results")
  final List<MovieVO> ? results;
  @JsonKey(name: "total_pages")
  final int ? total_pages;
  @JsonKey(name: "total")
  final int ? total_results;

  SimilarMovieResponse(this.page, this.results, this.total_pages, this.total_results);

  factory SimilarMovieResponse.fromJson(Map<String,dynamic> json)=>_$SimilarMovieResponseFromJson(json);
}