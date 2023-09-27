import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_flut_2/data/vos/actors_vo/known_for_vo/known_for_vo.dart';
part 'actors_vo.g.dart';
@JsonSerializable()
class ActorsVO{
  @JsonKey(name : "adult")
    final bool adult;
  
    @JsonKey(name : "gender")
    final int gender;
  
    @JsonKey(name : "id")
    final int id;
  
    @JsonKey(name : "known_for")
    final List<KnownForVO> known_for;
  
    @JsonKey(name : "known_for_department")
    final String known_for_department;
  
    @JsonKey(name : "name")
    final String name;
  
    @JsonKey(name : "popularity")
    final double popularity;
  
    @JsonKey(name : "profile_path")
    final String profile_path;

  ActorsVO(this.adult, this.gender, this.id, this.known_for, this.known_for_department, this.name, this.popularity, this.profile_path);
  
 factory ActorsVO.fromJson(Map<String,dynamic>json)=>_$ActorsVOFromJson(json);

}