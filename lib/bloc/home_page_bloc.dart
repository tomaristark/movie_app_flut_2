import 'package:movie_app_flut_2/bloc/base_bloc.dart';
import 'package:movie_app_flut_2/data/model/movie_model.dart';
import 'package:movie_app_flut_2/data/model/movie_model_impl.dart';
import 'package:movie_app_flut_2/data/vos/actor_vo/actor_vo.dart';
import 'package:movie_app_flut_2/data/vos/movie_genre_vo/movie_genre_vo.dart';

import '../data/vos/movie_vo/movie_vo.dart';


class HomePageBloc extends BaseBloc{


List<MovieGenreVO> movieGenreList = [];

List<MovieVO>? nowPlaying=[];
List<MovieVO>? youMayLike=[];
List<MovieVO>? popular=[];
List<ActorVO>? actor=[];
List<MovieVO>? movieByGenre = [];



// List<MovieGenreVO>  get getMovieGenreList => _movieGenreList;

HomePageBloc() {
movie.getMovieGenre().then((value){ movieGenreList =value;
notifyListeners();
});

movie.getNowPlayingMovie(1).then((value) { nowPlaying =value;
notifyListeners();
});

movie.getTopRatedMovie(1).then((value) {
  youMayLike = value;
  notifyListeners();
});

movie.getPopularMovie(1).then((value) {
  popular = value;
  notifyListeners();
});

movie.getActors(1).then((value) {
  actor = value;
  notifyListeners();
});
movie.getMovieByGenres(28).then((value) {
  movieByGenre = value;
  notifyListeners();
});
}

void getMovieByGenres(int genresID,int index){
    movieGenreList[0].isSelected= false;
    movieGenreList.map((e) {
      e.isSelected = false;
     }).toList();
    movieGenreList[index].isSelected= true;
    movie.getMovieByGenres(genresID).then((value) {
      movieByGenre = value;
      notifyListeners();
    });
    


}

}
