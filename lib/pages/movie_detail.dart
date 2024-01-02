import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flut_2/bloc/detail_page_bloc.dart';
import 'package:movie_app_flut_2/constant/api_constant.dart';
import 'package:movie_app_flut_2/constant/color.dart';
import 'package:movie_app_flut_2/constant/dimen.dart';
import 'package:movie_app_flut_2/constant/string.dart';
import 'package:movie_app_flut_2/data/vos/cast_crew_vo/crew_vo/crew_vo.dart';
import 'package:movie_app_flut_2/data/vos/movie_details/movie_details_vo.dart';
import 'package:movie_app_flut_2/pages/home_page.dart';
import 'package:movie_app_flut_2/widget/movie_widgets.dart';
import 'package:provider/provider.dart';

import '../data/vos/cast_crew_vo/cast_vo/cast_vo.dart';
import '../data/vos/movie_vo/movie_vo.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key,required this.movieID});

  final int movieID;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieDetailBloc(movieID),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: NestedScrollView(
          headerSliverBuilder:((context, innerBoxIsScrolled) => [
            SliverAppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              pinned: true,
              backgroundColor:kPrimaryColor,
                expandedHeight: MediaQuery.of(context).size.height*0.56,
                flexibleSpace: Selector<MovieDetailBloc,MovieDetailsVO?>(
                  selector:(_,bloc)=>bloc.movieDetail ,
                  builder:(_,value,__)=> FlexibleSpaceBar(
                    title: Text(value?.original_title??"",style: TextStyle(
                      fontSize: kSliverAppbarMovieNameFS
                    ),),
                    background: Stack(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: CachedNetworkImage(imageUrl: "$kBaseImageUrl${value?.poster_path??""}",fit: BoxFit.cover,)),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child :Padding(
                            padding: const EdgeInsets.only( bottom: kSP2x),
                            child: Text(
                              value?.genres.map((e) => e.name).toString()??"",style: TextStyle(
                                color: kSecondaryTextColor
                              ),
                            ),
                          )
                        ),
                        Positioned(
                          top: kMovieDetailBackButtomTop,
                          left: kMovieDetailBackButtomleft,
                          child: GestureDetector(
                            onTap:(){
                               Navigator.pop(context,
                                     MaterialPageRoute(builder: (context)=>const  HomePage()));
                            } ,
                            child: Container(
                              width: kMoveieDetailBackButtonWidthAndHeight,
                              height: kMoveieDetailBackButtonWidthAndHeight,
                              decoration:const BoxDecoration(
                                shape: BoxShape.circle,
                                color: kSecondaryColor
                              ),
                              child: const Icon(Icons.arrow_back,color:kBackIconColor),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            )
          ]), 
          body: ListView(
              children: [
                Column(
                  children: [
                    MovieDetailHeadTextWidget(textInMovieDetail:kMovieDetailStroyLineText ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                    Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width
                        ),
                        padding: EdgeInsets.all(0),
                      child: Selector<MovieDetailBloc,MovieDetailsVO?>(
                        selector: (_,bloc)=>bloc.movieDetail,
                        builder:(_,value,__)=> Text(
                          value?.overview??""
                          ,style: TextStyle(
                            color: kSecondaryTextColor
                          ), 
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                   const  MovieDetailHeadTextWidget(textInMovieDetail: kMovieDetailStarCastText),
                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                    Selector<MovieDetailBloc,List<CastVO>?>(
                      selector: (_,bloc)=>bloc.castList,
                      builder:(_,value,__)=> CastAndCrewWidget(isCast: true,castVO: value,)),
                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                  const   MovieDetailHeadTextWidget(textInMovieDetail: kMovieDetailTalentSquadText),
                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                    Selector<MovieDetailBloc,List<CrewVO>?>(
                      selector: (_,bloc)=>bloc.crewList,
                      builder:(_,value,__)=> CastAndCrewWidget(isCast: false,crewVO: value,)),
                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                    const MovieDetailHeadTextWidget(textInMovieDetail: kMovieDetailProductionComapanyText),
                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                    Selector<MovieDetailBloc,MovieDetailsVO?>(
                      selector: (_,bloc)=>bloc.movieDetail,
                      builder:(_,value,__)=> ProductionListWidget(productionList: value?.production_companies)),
                    const MovieDetailHeadTextWidget(textInMovieDetail: kMovieDetailRecommendedyText),

                    Selector<MovieDetailBloc,List<MovieVO>?>(
                      selector: (_,bloc)=>bloc.recommendedMovieList,
                      builder:(_,value,__)=> MoviesSessionViewWidget(movieSessionViewHeight: MediaQuery.of(context).size.height*0.28,movieList: value ,))
                  ],
                )
              ],
          )),
      ),
    );
  }
}