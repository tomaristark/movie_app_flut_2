
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_flut_2/data/vos/now_playing_vo/now_playing_date_vo/now_playing_date_vo.dart';
import 'package:movie_app_flut_2/data/vos/now_playing_vo/now_playing_vo.dart';

part 'now_playing_response.g.dart';

@JsonSerializable()
class NowPlayingResponse{

     @JsonKey(name : "dates")
    final NowPlayingDateVO dates;
  
    @JsonKey(name : "page")
    final int page;
  
    @JsonKey(name : "results")
    final List<NowPlayingVO> results;
  
    @JsonKey(name : "total_pages")
    final int total_pages;
  
    @JsonKey(name : "total_results")
    final int total_results;

  NowPlayingResponse(this.dates, this.page, this.results, this.total_pages, this.total_results);

  factory NowPlayingResponse.fromJson(Map<String,dynamic>json)=>_$NowPlayingResponseFromJson(json);
}