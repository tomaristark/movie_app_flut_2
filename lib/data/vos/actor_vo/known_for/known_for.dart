
import 'package:json_annotation/json_annotation.dart';

part 'known_for.g.dart';

@JsonSerializable()
class KnownForVO{

 @JsonKey(name : "adult")
     bool  ? adult;
  
    @JsonKey(name : "backdrop_path")
    String ? backdrop_path;
  
    @JsonKey(name : "genre_ids")
    List<int> ? genre_ids;
  
    @JsonKey(name : "id")
     int ? id;
  
    @JsonKey(name : "media_type")
     String ? media_type;
  
    @JsonKey(name : "original_language")
    String ? original_language;
  
    @JsonKey(name : "original_title")
     String? original_title;
  
    @JsonKey(name : "overview")
     String ? overview;
  
    @JsonKey(name : "poster_path")
     String ? poster_path;
  
    @JsonKey(name : "release_date")
    String ? release_date;
  
    @JsonKey(name : "title")
   String ? title;
  
    @JsonKey(name : "video")
     bool ? video;
  
    @JsonKey(name : "vote_average")
    double ? vote_average;
  
    @JsonKey(name : "vote_count")
   int ? vote_count;

  KnownForVO(this.adult, this.backdrop_path, this.genre_ids, this.id, this.media_type, this.original_language, this.original_title, this.overview, this.poster_path, this.release_date, this.title, this.video, this.vote_average, this.vote_count);

  factory KnownForVO.fromJson(Map<String,dynamic>json) => _$KnownForVOFromJson(json);


}