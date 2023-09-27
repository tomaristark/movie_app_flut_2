
import 'package:json_annotation/json_annotation.dart';

part 'now_playing_date_vo.g.dart';

@JsonSerializable()
class NowPlayingDateVO{
    @JsonKey(name : "maximum")
    final String maximum;
  
    @JsonKey(name : "minimum")
    final String minimum;

  NowPlayingDateVO(this.maximum, this.minimum);

  factory NowPlayingDateVO.fromJson(Map<String,dynamic>json)=>_$NowPlayingDateVOFromJson(json);

}