import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_flut_2/data/vos/actors_vo/actors_vo.dart';

part 'actors_response.g.dart';

@JsonSerializable()
class ActorsResponse{
    @JsonKey(name : "page")
    final int page;
  
    @JsonKey(name : "results")
    final List<ActorsVO> results;
  
    @JsonKey(name : "total_pages")
    final int total_pages;
  
    @JsonKey(name : "total_results")
    final int total_results;

  ActorsResponse(this.page, this.results, this.total_pages, this.total_results);

    factory ActorsResponse.fromJson(Map<String,dynamic>json)=> _$ActorsResponseFromJson(json);
}