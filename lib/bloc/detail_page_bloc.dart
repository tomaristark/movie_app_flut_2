import 'package:movie_app_flut_2/bloc/base_bloc.dart';
import 'package:movie_app_flut_2/data/vos/cast_crew_vo/cast_vo/cast_vo.dart';
import 'package:movie_app_flut_2/data/vos/cast_crew_vo/crew_vo/crew_vo.dart';
import 'package:movie_app_flut_2/data/vos/movie_details/movie_details_vo.dart';

import '../data/vos/movie_vo/movie_vo.dart';

class MovieDetailBloc extends BaseBloc{

   MovieDetailsVO ? movieDetail;

   List<MovieVO> ? recommendedMovieList;

   List<CrewVO> ? crewList;

   List<CastVO> ? castList;

 


MovieDetailBloc(int movieID){
    movie.getMovieDetail(movieID).then((value){
       movieDetail = value;
       notifyListeners();
  });
    movie.getSimilarMovie(movieID).then((value){
      recommendedMovieList = value;
      notifyListeners();
    });
    movie.getMovieCrew(movieID).then((value){
      crewList = value;
      notifyListeners();
    });
    movie.getMovieCast(movieID).then((value){
      castList = value;
      notifyListeners();
    });
    
  }
  
}