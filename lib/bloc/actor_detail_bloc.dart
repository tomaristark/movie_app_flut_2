
import 'package:movie_app_flut_2/bloc/base_bloc.dart';
import 'package:movie_app_flut_2/bloc/home_page_bloc.dart';
import 'package:movie_app_flut_2/data/vos/actor_detail_vo/actor_detail_vo.dart';
import 'package:movie_app_flut_2/data/vos/actor_vo/known_for/known_for.dart';

import '../data/vos/actor_vo/actor_vo.dart';

class ActorDetailBloc extends BaseBloc{

  ActorDetailVO ? actorDetail;


  ActorDetailBloc(int actorID){
    movie.getActorDetail(actorID).then((value) {
      actorDetail = value;
      notifyListeners();
    });
    
  }
}