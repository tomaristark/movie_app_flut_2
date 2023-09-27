import 'package:json_annotation/json_annotation.dart';

part 'movie_genre_vo.g.dart';

@JsonSerializable()
class MovieGenreVO{
    @JsonKey(name : "id")
    final int id;
  
    @JsonKey(name : "name")
    final String name;

  MovieGenreVO(this.id, this.name);

  factory MovieGenreVO.fromJson(Map<String,dynamic>json)=>_$MovieGenreVOFromJson(json); 
}