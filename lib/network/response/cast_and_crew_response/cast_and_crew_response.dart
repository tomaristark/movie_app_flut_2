
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_flut_2/data/vos/cast_crew_vo/cast_vo/cast_vo.dart';
import 'package:movie_app_flut_2/data/vos/cast_crew_vo/crew_vo/crew_vo.dart';

part 'cast_and_crew_response.g.dart';

@JsonSerializable()
class CastAndCrewResponse{

  final int id;

  final List<CastVO> cast;

  final List<CrewVO> crew;

  CastAndCrewResponse(this.id, this.cast, this.crew);

  factory CastAndCrewResponse.fromJson(Map<String,dynamic> json)=> _$CastAndCrewResponseFromJson(json);
}