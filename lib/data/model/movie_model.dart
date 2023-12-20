
import 'package:movie_app_flut_2/data/vos/actor_vo/actor_vo.dart';

import '../vos/actor_detail_vo/actor_detail_vo.dart';
import '../vos/cast_crew_vo/cast_vo/cast_vo.dart';
import '../vos/cast_crew_vo/crew_vo/crew_vo.dart';
import '../vos/movie_details/movie_details_vo.dart';
import '../vos/movie_genre_vo/movie_genre_vo.dart';
import '../vos/movie_vo/movie_vo.dart';

abstract class MovieModel{
   Future<List<MovieVO>?> getSearchMovie(String keyword);

  Future<List<MovieGenreVO>>getMovieGenre();

  Future<List<MovieVO>?>getMovieByGenres(int genresID);

  Future<List<MovieVO>?>getNowPlayingMovie(int page);

  Future<List<MovieVO>?>getTopRatedMovie(int page);

  Future<List<MovieVO>?>getPopularMovie(int page);

  Future<List<MovieVO>?>getSimilarMovie(int movieID);

  Future<MovieDetailsVO>getMovieDetail(int movieID);

  Future<List<CastVO>?>getMovieCast(int movieID);

  Future<List<CrewVO>?>getMovieCrew(int movieID);

  Future<List<ActorVO>?>getActors(int page);

  Future <ActorDetailVO> getActorDetail(int actorID);
  
}