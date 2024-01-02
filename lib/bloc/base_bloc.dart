
import 'package:flutter/material.dart';
import 'package:movie_app_flut_2/data/model/movie_model.dart';
import 'package:movie_app_flut_2/data/model/movie_model_impl.dart';

class BaseBloc extends ChangeNotifier{
  bool _isDispose = false;

  final MovieModel movie =MovieModelImpl();

  @override
  void notifyListeners() {
    if(!_isDispose){
    
    super.notifyListeners();
    }
  }

  @override
  void dispose() {
   _isDispose= true;
    super.dispose();
  }
}