import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flut_2/constant/color.dart';
import 'package:movie_app_flut_2/constant/dimen.dart';
import 'package:movie_app_flut_2/constant/string.dart';
import 'package:movie_app_flut_2/pages/home_page.dart';
import 'package:movie_app_flut_2/widget/movie_detail.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: NestedScrollView(
        headerSliverBuilder:((context, innerBoxIsScrolled) => [
          SliverAppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            pinned: true,
            backgroundColor:kPrimaryColor,
              expandedHeight: MediaQuery.of(context).size.height*0.56,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(kMovieName,style: TextStyle(
                  fontSize: kSliverAppbarMovieNameFS
                ),),
                background: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: CachedNetworkImage(imageUrl: kNetworkImage,fit: BoxFit.cover,)),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child :Padding(
                        padding: const EdgeInsets.only( bottom: kSP2x),
                        child: Text(
                          kMovieDetailGenreText,style: TextStyle(
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
                    child: Text(
                      kMovieDetailText
                      ,style: TextStyle(
                        color: kSecondaryTextColor
                      ), 
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  MovieDetailHeadTextWidget(textInMovieDetail: kMovieDetailStarCastText),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                  CastAndCrewWidget(topTextCL: kMovieDetailActorText, botTextCL: "Luffy"),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                  MovieDetailHeadTextWidget(textInMovieDetail: kMovieDetailTalentSquadText),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                  CastAndCrewWidget(topTextCL: kMovieDetailCrewText, botTextCL: "netflix"),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                  MovieDetailHeadTextWidget(textInMovieDetail: kMovieDetailProductionComapanyText),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                  ProductionListWidget(studioName: "NEtflix"),
                  MovieDetailHeadTextWidget(textInMovieDetail: kMovieDetailRecommendedyText),
                  MoviesSessionViewWidget(movieSessionViewHeight: MediaQuery.of(context).size.height*0.28)
                ],
              )
            ],
        )),
    );
  }
}