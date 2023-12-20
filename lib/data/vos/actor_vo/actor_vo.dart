import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_flut_2/data/vos/actor_vo/known_for/known_for.dart';

part 'actor_vo.g.dart';
@JsonSerializable()
class ActorVO{
  
    @JsonKey(name : "adult")
     bool ?  adult;
  
    @JsonKey(name : "gender")
     int ? gender;
  
    @JsonKey(name : "id")
     int  ? id;
  
    @JsonKey(name : "known_for")
    final List<KnownForVO> ? known_for;
  
    @JsonKey(name : "known_for_department")
    String ? known_for_department;
  
    @JsonKey(name : "name")
     String ? name;
  
    @JsonKey(name : "popularity")
     double ? popularity;
  
    @JsonKey(name : "profile_path")
    String ? profile_path;

  ActorVO(this.adult, this.gender, this.id, this.known_for, this.known_for_department, this.name, this.popularity, this.profile_path);
  
  factory ActorVO.fromJson(Map<String,dynamic>json) => _$ActorVOFromJson(json);

  @override
  String toString() {
    return "$id $name";
  }
}