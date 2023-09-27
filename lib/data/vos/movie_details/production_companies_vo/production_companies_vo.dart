
import 'package:json_annotation/json_annotation.dart';

part 'production_companies_vo.g.dart';

@JsonSerializable()
class ProductionCompaniesVO{
    @JsonKey(name : "id")
    final int id;
  
    @JsonKey(name : "logo_path")
    final String ? logo_path;
  
    @JsonKey(name : "name")
    final String name;
  
    @JsonKey(name : "origin_country")
    final String origin_country;

  ProductionCompaniesVO(this.id, this.logo_path, this.name, this.origin_country);

  factory ProductionCompaniesVO.fromJson(Map<String,dynamic>json)=>_$ProductionCompaniesVOFromJson(json);
}