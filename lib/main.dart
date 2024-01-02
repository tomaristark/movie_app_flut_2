import 'package:flutter/material.dart';
import 'package:movie_app_flut_2/data/model/movie_model.dart';
import 'package:movie_app_flut_2/data/model/movie_model_impl.dart';
import 'package:movie_app_flut_2/network/data_agent/movie_data_agent_impl.dart';
import 'package:movie_app_flut_2/network/data_agent/movie_data_agent.dart';
// import 'package:movie_app_flut_2/data/model/movie_model.dart';
// import 'package:movie_app_flut_2/data/model/movie_model_impl.dart';
// import 'package:movie_app_flut_2/network/data_agent/movie_app_data_agent.dart';
// import 'package:movie_app_flut_2/network/data_agent/movie_app_data_agent_impl.dart';
import 'package:movie_app_flut_2/pages/home_page.dart';

void main() {
  runApp(const MyApp());
  // MovieDataAgent _movieData = MovieDataAgentImpl();
  // _movieData.getSearchMovie("zom").then((value) => print(value)).catchError((error)=> print(error));
  // _movieData.getNowPlayingMovie().then((value) => print(value)).catchError((error)=> print(error));
  // _movieData.getActors().then((value) => print(value)).catchError((error)=>print(error));
  
  MovieModel _model = MovieModelImpl();
  // _model.getActors(1).then((value) => print(value));
  // _model.getMovieGenre().then((value) => print(value));
  _model.getActors(1).then((value) => value?.map((e) =>print(e.known_for)));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage()
    );
  }
}
