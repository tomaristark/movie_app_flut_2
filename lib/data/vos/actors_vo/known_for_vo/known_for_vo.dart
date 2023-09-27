
import 'package:json_annotation/json_annotation.dart';

part 'known_for_vo.g.dart';

@JsonSerializable()
class KnownForVO{
   
   @JsonKey(name : "adult")
    final bool adult;
  
    @JsonKey(name : "backdrop_path")
    final String backdrop_path;
  
    @JsonKey(name : "genre_ids")
    final List<int> genre_ids;
  
    @JsonKey(name : "id")
    final int id;
  
    @JsonKey(name : "media_type")
    final String media_type;
  
    @JsonKey(name : "original_language")
    final String original_language;
  
    @JsonKey(name : "original_title")
    final String original_title;
  
    @JsonKey(name : "overview")
    final String overview;
  
    @JsonKey(name : "poster_path")
    final String poster_path;
  
    @JsonKey(name : "release_date")
    final String release_date;
  
    @JsonKey(name : "title")
    final String title;
  
    @JsonKey(name : "video")
    final bool video;
  
    @JsonKey(name : "vote_average")
    final double vote_average;
  
    @JsonKey(name : "vote_count")
    final int vote_count;

  KnownForVO(this.adult, this.backdrop_path, this.genre_ids, this.id, this.media_type, this.original_language, this.original_title, this.overview, this.poster_path, this.release_date, this.title, this.video, this.vote_average, this.vote_count);

  factory KnownForVO.fromJson(Map<String,dynamic>json) => _$KnownForVOFromJson(json);

  
}