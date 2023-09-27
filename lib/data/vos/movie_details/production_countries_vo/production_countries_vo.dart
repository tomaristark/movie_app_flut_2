
import 'package:json_annotation/json_annotation.dart';

part 'production_countries_vo.g.dart';
@JsonSerializable()
class ProductionConuntriesVO {
     @JsonKey(name : "iso_3166_1")
    final String iso_3166_1;
  
    @JsonKey(name : "name")
    final String name;

  ProductionConuntriesVO(this.iso_3166_1, this.name);

  factory ProductionConuntriesVO.fromJson (Map<String,dynamic>json) => _$ProductionConuntriesVOFromJson(json);
}