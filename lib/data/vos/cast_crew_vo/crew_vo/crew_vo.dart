
import 'package:json_annotation/json_annotation.dart';

part 'crew_vo.g.dart';

@JsonSerializable()
class CrewVO{
  @JsonKey(name : "adult")
    final bool ? adult;
  
    @JsonKey(name : "gender")
    final int ? gender;
  
    @JsonKey(name : "id")
    final int ? id;
  
    @JsonKey(name : "known_for_department")
    final String ? known_for_department;
  
    @JsonKey(name : "name")
    final String ? name;
  
    @JsonKey(name : "original_name")
    final String ? original_name;
  
    @JsonKey(name : "popularity")
    final double ? popularity;
  
    @JsonKey(name : "profile_path")
    final String ? profile_path;
  
    @JsonKey(name : "credit_id")
    final String ? credit_id;
  
    @JsonKey(name : "department")
    final String ? department;
  
    @JsonKey(name : "job")
    final String ? job;

  CrewVO(this.adult, this.gender, this.id, this.known_for_department, this.name, this.original_name, this.popularity, this.profile_path, this.credit_id, this.department, this.job);
  
  factory CrewVO.fromJson(Map<String,dynamic> json)=> _$CrewVOFromJson(json);
}