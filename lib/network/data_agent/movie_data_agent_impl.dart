import 'package:dio/dio.dart';
import 'package:movie_app_flut_2/constant/api_constant.dart';
import 'package:movie_app_flut_2/data/vos/actor_detail_vo/actor_detail_vo.dart';
import 'package:movie_app_flut_2/data/vos/actor_vo/actor_vo.dart';
import 'package:movie_app_flut_2/data/vos/cast_crew_vo/cast_vo/cast_vo.dart';
import 'package:movie_app_flut_2/data/vos/cast_crew_vo/crew_vo/crew_vo.dart';
import 'package:movie_app_flut_2/data/vos/movie_details/movie_details_vo.dart';
// import 'package:movie_app_flut_2/data/vos/actors_vo/actors_vo.dart';
import 'package:movie_app_flut_2/data/vos/movie_genre_vo/movie_genre_vo.dart';
import 'package:movie_app_flut_2/data/vos/movie_vo/movie_vo.dart';
import 'package:movie_app_flut_2/network/api/movie_api.dart';
import 'package:movie_app_flut_2/network/data_agent/movie_data_agent.dart';

class MovieDataAgentImpl extends MovieDataAgent{
  late MovieAPI _movieAPI;

  MovieDataAgentImpl._(){
    _movieAPI = MovieAPI(Dio());
  }

  static final MovieDataAgentImpl _singleton = MovieDataAgentImpl._();

  factory MovieDataAgentImpl ()=> _singleton;


  
  @override
  Future<List<MovieGenreVO>> getMovieGenre() =>
   _movieAPI.getMovieGenre(kApiKey, kLanguage)
   .asStream().map((event) => event.genres).first;

  @override
  Future<List<MovieVO>?> getNowPlayingMovie(int page) =>
    _movieAPI.getNowPlayingMovie(kApiKey, kLanguage, page)
    .asStream().map((event) => event.results).first;

  @override
  Future<List<ActorVO>?> getActors(int page) =>
      _movieAPI.getActors(kApiKey, kLanguage, page)
      .asStream().map((event) => event.results).first;
      
  @override
  Future<List<MovieVO>?> getPopularMovie(int page) {
     return  _movieAPI.getPopularMovie(kApiKey, kLanguage, page )
      .asStream().map((event) => event.results).first;
   }
      
  @override
  Future<List<MovieVO>?> getTopRatedMovie(int page) {
    return _movieAPI.getTopRatedMovie(kApiKey, kLanguage, page)
    .asStream().map((event) => event.results).first;
        }
        
  @override
  Future<List<MovieVO>?> getMovieByGenres(int genresID) {
    return _movieAPI.getMovieByGenres(genresID.toString(), kApiKey, kLanguage, kPage)
    .asStream().map((event) => event.results).first;
         }

  @override
  Future<ActorDetailVO> getActorDetail(int actorID) {
    return _movieAPI.getActorDetail(kApiKey, actorID.toString(),);
  }

  @override
  Future<List<MovieVO>?> getSimilarMovie(int movieID) {
  return _movieAPI.getSimilarMovie(kApiKey, kPage, movieID.toString())
  .asStream().map((event) => event.results).first;
  }

  @override
  Future<MovieDetailsVO> getMovieDetail(int movieID) {
   return _movieAPI.getMovieDetail(kApiKey, movieID.toString());
  }

  @override
  Future<List<CastVO>?> getMovieCast(int movieID) {
    return _movieAPI.getCastAndCrew(kApiKey, movieID.toString()).asStream()
    .map((event) => event.cast).first;
  }

  @override
  Future<List<CrewVO>?> getMovieCrew(int movieID) {
    return _movieAPI.getCastAndCrew(kApiKey, movieID.toString())
    .asStream().map((event) => event.crew).first;
  }
  
  @override
  Future<List<MovieVO>?> getSearchMovie(String keyword) {
    return _movieAPI.getSearchData(kApiKey, keyword, kPage)
    .asStream().map((event) => event.results).first;
  }

  

  
      

 
    
  
  
}