
import 'package:dio/dio.dart';
import 'package:movie_app_flut_2/constant/api_constant.dart';
import 'package:movie_app_flut_2/data/vos/actor_detail_vo/actor_detail_vo.dart';
import 'package:movie_app_flut_2/data/vos/movie_details/movie_details_vo.dart';
import 'package:movie_app_flut_2/network/response/actor_response/actors_response.dart';
import 'package:movie_app_flut_2/network/response/cast_and_crew_response/cast_and_crew_response.dart';
import 'package:movie_app_flut_2/network/response/movie_by_genre_response/movie_by_genre_response.dart';
import 'package:movie_app_flut_2/network/response/movie_genre_response/movie_genre_response.dart';
import 'package:movie_app_flut_2/network/response/movie_search_response/movie_search_response.dart';
import 'package:movie_app_flut_2/network/response/now_playing_response/now_playing_response.dart';
import 'package:movie_app_flut_2/network/response/popular_movie_response/popular_response.dart';
import 'package:movie_app_flut_2/network/response/similar_movie_response/similar_movie_response.dart';
import 'package:movie_app_flut_2/network/response/top_rated_response/top_rated_response.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_api.g.dart';

@RestApi(baseUrl: kBaseURL)
abstract class MovieAPI{
  factory MovieAPI(Dio dio)= _MovieAPI;

  @GET(kSearchMovieEndPoint)
  Future<MovieSearchResponse>getSearchData(
    @Query(kQueryParamsAPIKey)String apiKey,
    @Query(kQueryParamsQuery)String keyword,
    @Query(kQueryParamsPage)int page,
  );

  @GET(kMovieGenreEndPoint)
  Future<MovieGenreResponse> getMovieGenre(
    @Query(kQueryParamsAPIKey)String apiKey,
    @Query(kLanguage)String language
  );

  @GET(kMovieByGenreEndPoint)
  Future<MovieByGenreResponse> getMovieByGenres(
    @Query(kQueryParamsWithGenres)String genresID,
    @Query(kQueryParamsAPIKey)String apiKey,
    @Query(kQueryParamsLanguage)String language,
    @Query(kQueryParamsPage)int page,
  );

  @GET(kNowPlayingEndPoint)
  Future<NowPlayingResponse>getNowPlayingMovie(
    @Query(kQueryParamsAPIKey)String apiKey,
    @Query(kQueryParamsLanguage)String language,
    @Query(kQueryParamsPage)int page,
  );

  @GET(kPopularMoviesEndPoint)
  Future<PopularMovieResponse>getPopularMovie(
    @Query(kQueryParamsAPIKey)String apiKey,
    @Query(kQueryParamsLanguage)String language,
    @Query(kQueryParamsPage)int page,
  );
  
  @GET(kTopRatedMoviesEndPoint)
  Future<TopRatedMoviesResponse>getTopRatedMovie(
    @Query(kQueryParamsAPIKey)String apiKey,
    @Query(kQueryParamsLanguage)String language,
    @Query(kQueryParamsPage)int page
  );

  @GET('$kMovieEndPoint/{movie_id}/$kSimilarMoviesEndPoint')
  Future<SimilarMovieResponse>getSimilarMovie(
    @Query(kQueryParamsAPIKey)String apiKey,
    @Query(kQueryParamsPage)int page,
    @Path('movie_id')String movieID,
  );

  @GET('$kMovieEndPoint/{movie_id}')
  Future<MovieDetailsVO>getMovieDetail(
    @Query(kQueryParamsAPIKey)String apiKey,
    @Path('movie_id')String movieID,
  );
  
  @GET('$kMovieEndPoint/{movie_id}$kCreditsEndPoint')
  Future<CastAndCrewResponse>getCastAndCrew(
    @Query(kQueryParamsAPIKey)String apiKey,
    @Path('movie_id')String movieID,
  );
  
  @GET(kActorEndPoint)
  Future<ActorsResponse>getActors(
    @Query(kQueryParamsAPIKey)String apiKey,
    @Query(kQueryParamsLanguage)String language,
    @Query(kQueryParamsPage)int page,
  );

  @GET('$kActorDetailEndPoint/{actor_id}')
  Future<ActorDetailVO>getActorDetail(
    @Query(kQueryParamsAPIKey)String apiKey,
    @Path('actor_id')String actorID,
  );


  


}