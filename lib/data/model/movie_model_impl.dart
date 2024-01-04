import 'package:movie_app_flut_2/data/model/movie_model.dart';
import 'package:movie_app_flut_2/data/vos/actor_detail_vo/actor_detail_vo.dart';
import 'package:movie_app_flut_2/data/vos/actor_vo/actor_vo.dart';
import 'package:movie_app_flut_2/data/vos/cast_crew_vo/cast_vo/cast_vo.dart';
import 'package:movie_app_flut_2/data/vos/cast_crew_vo/crew_vo/crew_vo.dart';
import 'package:movie_app_flut_2/data/vos/movie_details/movie_details_vo.dart';
import 'package:movie_app_flut_2/data/vos/movie_genre_vo/movie_genre_vo.dart';
import 'package:movie_app_flut_2/data/vos/movie_vo/movie_vo.dart';
import 'package:movie_app_flut_2/network/data_agent/movie_data_agent.dart';
import 'package:movie_app_flut_2/network/data_agent/movie_data_agent_impl.dart';

class MovieModelImpl extends MovieModel{
  final MovieDataAgent _dataAgent = MovieDataAgentImpl();

  MovieModelImpl._();

  static final MovieModelImpl _singleton = MovieModelImpl._();

  factory MovieModelImpl() => _singleton;

  @override
  Future<List<ActorVO>?> getActors(int page) =>
  _dataAgent.getActors(page).then((value) {
    return value;
  });

  @override
  Future<ActorDetailVO> getActorDetail(int actorID) =>
    _dataAgent.getActorDetail(actorID).then((value) => value);


  @override
  Future<List<MovieVO>?> getMovieByGenres(int genresID) {
    return _dataAgent.getMovieByGenres(genresID).then((value) => value);
  }

  @override
  Future<List<CastVO>?> getMovieCast(int movieID) {
    return _dataAgent.getMovieCast(movieID).then((value) => value);
  }

  @override
  Future<List<CrewVO>?> getMovieCrew(int movieID) {
   return _dataAgent.getMovieCrew(movieID).then((value) => value);
  }

  @override
  Future<MovieDetailsVO> getMovieDetail(int movieID) {
    return _dataAgent.getMovieDetail(movieID).then((value) => value);
  }

  @override
  Future<List<MovieGenreVO>> getMovieGenre() {
    return _dataAgent.getMovieGenre().then((value){
     var temp = value;
     temp[0].isSelected = true;
     return temp;
    });
  }

  @override
  Future<List<MovieVO>?> getNowPlayingMovie(int page) {
    return _dataAgent.getNowPlayingMovie(page).then((value) => value);
  }

  @override
  Future<List<MovieVO>?> getPopularMovie(int page) {
    return _dataAgent.getPopularMovie(page).then((value) => value);
  }

  @override
  Future<List<MovieVO>?> getSearchMovie(String keyword) {
    return _dataAgent.getSearchMovie(keyword).then((value) => value);
  }

  @override
  Future<List<MovieVO>?> getSimilarMovie(int movieID) {
    return _dataAgent.getSimilarMovie(movieID).then((value) => value);
  }

  @override
  Future<List<MovieVO>?> getTopRatedMovie(int page) {
    return _dataAgent.getTopRatedMovie(page).then((value) => value);
  }
   

}