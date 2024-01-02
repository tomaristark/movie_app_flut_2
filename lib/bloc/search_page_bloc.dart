
import 'dart:async';

import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:movie_app_flut_2/bloc/base_bloc.dart';

import '../data/vos/movie_vo/movie_vo.dart';

class SearchPageBloc extends BaseBloc{
  List<MovieVO>? movieBySearch = [];
  // final Debouncer _debouncer = Debouncer();
  Timer ? _debounce;
  // final Duration  _debounceDuration= const Duration(milliseconds: 10);


  void getMovie(String keyword) {
    if (_debounce?.isActive ?? false){_debounce?.cancel();}
    _debounce = Timer(const Duration(milliseconds: 500), () async{
        await movie.getSearchMovie(keyword).then((value) {
          movieBySearch = value;
          notifyListeners();
        });
    });
    }

    @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
  }

  // void getMovie(String keyword){
  //   const duration = Duration(milliseconds: 500);
  //   _debouncer.debounce(duration: duration, onDebounce:
  //    ()async {
  //     await movie.getSearchMovie(keyword).then((value){
  //       movieBySearch = value;
  //       notifyListeners();
  //     });
  //    });
  // }

    



  