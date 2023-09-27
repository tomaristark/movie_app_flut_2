
import 'package:json_annotation/json_annotation.dart';

part 'spoken_languages_vo.g.dart';

@JsonSerializable()
class SpokenLanguagesVO{
      @JsonKey(name : "english_name")
    final String english_name;
  
    @JsonKey(name : "iso_639_1")
    final String iso_639_1;
  
    @JsonKey(name : "name")
    final String name;

  SpokenLanguagesVO(this.english_name, this.iso_639_1, this.name);

  factory SpokenLanguagesVO.fromJson(Map<String,dynamic>json)=>_$SpokenLanguagesVOFromJson(json);
} 