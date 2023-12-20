// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'actor_detail_vo.g.dart';
@JsonSerializable()
class ActorDetailVO {
    @JsonKey(name : "adult")
    final bool adult;
  
    @JsonKey(name : "also_known_as")
    final List<String> also_known_as;
  
    @JsonKey(name : "biography")
    final String biography;
  
    @JsonKey(name : "birthday")
    final String birthday;
  
    @JsonKey(name : "deathday")
    final String ? deathday;
  
    @JsonKey(name : "gender")
    final int gender;
  
    @JsonKey(name : "homepage")
    final String ? homepage;
  
    @JsonKey(name : "id")
    final int id;
  
    @JsonKey(name : "imdb_id")
    final String imdb_id;
  
    @JsonKey(name : "known_for_department")
    final String known_for_department;
  
    @JsonKey(name : "name")
    final String name;
  
    @JsonKey(name : "place_of_birth")
    final String place_of_birth;
  
    @JsonKey(name : "popularity")
    final double popularity;
  
    @JsonKey(name : "profile_path")
    final String profile_path;

  ActorDetailVO(this.adult, this.also_known_as, this.biography, this.birthday, this.deathday, this.gender, this.homepage, this.id, this.imdb_id, this.known_for_department, this.name, this.place_of_birth, this.popularity, this.profile_path);
  
  factory ActorDetailVO.fromJson(Map<String,dynamic> json) => _$ActorDetailVOFromJson(json);


  @override
  String toString() {
    return 'ActorDetailVO(adult: $adult, also_known_as: $also_known_as, biography: $biography, birthday: $birthday, deathday: $deathday, gender: $gender, homepage: $homepage, id: $id, imdb_id: $imdb_id, known_for_department: $known_for_department, name: $name, place_of_birth: $place_of_birth, popularity: $popularity, profile_path: $profile_path)';
  }
}
