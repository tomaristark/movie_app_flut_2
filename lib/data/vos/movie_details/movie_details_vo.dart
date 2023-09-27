
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_flut_2/data/vos/movie_details/production_companies_vo/production_companies_vo.dart';
import 'package:movie_app_flut_2/data/vos/movie_details/production_countries_vo/production_countries_vo.dart';
import 'package:movie_app_flut_2/data/vos/movie_details/spoken_languages_vo/spoken_languages_vo.dart';
import 'package:movie_app_flut_2/data/vos/movie_genre_vo/movie_genre_vo.dart';

part 'movie_details_vo.g.dart';

@JsonSerializable()
class MovieDetailsVO{
  @JsonKey(name : "adult")
    final bool adult;
  
    @JsonKey(name : "backdrop_path")
    final String backdrop_path;
  
    @JsonKey(name : "belongs_to_collection")
    final String ? belongs_to_collection;
  
    @JsonKey(name : "budget")
    final int budget;
  
    @JsonKey(name : "genres")
    final List<MovieGenreVO> genres;
  
    @JsonKey(name : "homepage")
    final String homepage;
  
    @JsonKey(name : "id")
    final int id;
  
    @JsonKey(name : "imdb_id")
    final String imdb_id;
  
    @JsonKey(name : "original_language")
    final String original_language;
  
    @JsonKey(name : "original_title")
    final String original_title;
  
    @JsonKey(name : "overview")
    final String overview;
  
    @JsonKey(name : "popularity")
    final double popularity;
  
    @JsonKey(name : "poster_path")
    final String poster_path;
  
    @JsonKey(name : "production_companies")
    final List<ProductionCompaniesVO> production_companies;
  
    @JsonKey(name : "production_countries")
    final List<ProductionConuntriesVO> production_countries;
  
    @JsonKey(name : "release_date")
    final String release_date;
  
    @JsonKey(name : "revenue")
    final int revenue;
  
    @JsonKey(name : "runtime")
    final int runtime;
  
    @JsonKey(name : "spoken_languages")
    final List<SpokenLanguagesVO> spoken_languages;
  
    @JsonKey(name : "status")
    final String status;
  
    @JsonKey(name : "tagline")
    final String tagline;
  
    @JsonKey(name : "title")
    final String title;
  
    @JsonKey(name : "video")
    final bool video;
  
    @JsonKey(name : "vote_average")
    final double vote_average;
  
    @JsonKey(name : "vote_count")
    final int vote_count;

  MovieDetailsVO(this.adult, this.backdrop_path, this.belongs_to_collection, this.budget, this.genres, this.homepage, this.id, this.imdb_id, this.original_language, this.original_title, this.overview, this.popularity, this.poster_path, this.production_companies, this.production_countries, this.release_date, this.revenue, this.runtime, this.spoken_languages, this.status, this.tagline, this.title, this.video, this.vote_average, this.vote_count);

    factory MovieDetailsVO.fromJson(Map<String,dynamic>json)=> _$MovieDetailsVOFromJson(json);
}