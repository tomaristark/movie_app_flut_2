import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_flut_2/data/vos/movie_genre_vo/movie_genre_vo.dart';

part 'movie_genre_response.g.dart';

@JsonSerializable()
class MovieGenreResponse {
    @JsonKey(name : "genres")
    final List<MovieGenreVO> genres;

  MovieGenreResponse(this.genres);

  factory MovieGenreResponse.fromJson(Map<String,dynamic>json)=>_$MovieGenreResponseFromJson(json);
    
}