
import 'package:flutter/material.dart';
import 'package:movie_app_flut_2/bloc/actor_detail_bloc.dart';

import 'package:movie_app_flut_2/constant/color.dart';
import 'package:movie_app_flut_2/constant/dimen.dart';
import 'package:movie_app_flut_2/constant/string.dart';
import 'package:movie_app_flut_2/data/vos/actor_vo/known_for/known_for.dart';

import 'package:movie_app_flut_2/pages/home_page.dart';
import 'package:movie_app_flut_2/widget/cache_image_widget.dart';
import 'package:movie_app_flut_2/widget/movie_widgets.dart';
import 'package:provider/provider.dart';

import '../data/vos/actor_detail_vo/actor_detail_vo.dart';

class ActorDetailPage extends StatelessWidget {
  const ActorDetailPage({super.key,required this.actorID, required this.knownForList});

  final int actorID;
  final List<KnownForVO> ? knownForList;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>ActorDetailBloc(actorID),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        // backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder:((context, innerBoxIsScrolled) => [
            SliverAppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              pinned: true,
              backgroundColor:kPrimaryColor,
                expandedHeight: MediaQuery.of(context).size.height*0.56,
                flexibleSpace: Selector<ActorDetailBloc,ActorDetailVO?>(
                  selector: (_,bloc)=> bloc.actorDetail,
                  builder:(_,value,__)=> FlexibleSpaceBar(
                    title: Text(value?.name??"",style:const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: kActorDetailActorNameFS
                    ),),
                    background: Stack(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: CacheImageWidget(imageUrl: value?.profile_path)
                          ),
                        Positioned(
                          top: kActorDetailBackButtomTop,
                          left: kActorDetailBackButtomleft,
                          child: GestureDetector(
                            onTap:(){
                               Navigator.pop(context,
                                     MaterialPageRoute(builder: (context)=>const  HomePage()));
                            } ,
                            child: Container(
                              width: kActorDetailBackbuttomWidthAndHeight,
                              height: kActorDetailBackbuttomWidthAndHeight,
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
          body: Selector<ActorDetailBloc,ActorDetailVO?>(
            selector: (_,bloc)=>bloc.actorDetail,
            builder:(_,value,__)=>(value == null)? const Center(child: CircularProgressIndicator()): ListView(
              children: [
                const ArtistHeading(artistHeading:kActorDetailBiographyText),
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: kSP2x),
                  child: Divider(thickness: 2,color: kDividerColor,),
                ),
                   Text(
                    value.biography
                    ,style:const TextStyle(
                      color: kSecondaryTextColor,
                      fontSize: kActorDetailBiographyFS,
                    ),
                               ),
                const Padding(
                  padding:  EdgeInsets.only(top: kSP20x),
                  child: ArtistHeading(artistHeading: kActorDetailMoreInformationText),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: Divider(thickness: 2,color: kDividerColor,),
                ),
                MoreInfoText(leftMoreinfoText: kActorDetailPlaceOfBirthText, rightMoreinfoText: value.place_of_birth),
                HeightBetweenMoreInfoText(),
                MoreInfoText(leftMoreinfoText: kActorDetailBirthdayText, rightMoreinfoText: value.birthday),
                HeightBetweenMoreInfoText(),
                MoreInfoText(leftMoreinfoText: kActorDetailDeathdayText, rightMoreinfoText: value.deathday??"-"),
                HeightBetweenMoreInfoText(),
                MoreInfoText(leftMoreinfoText: kActorDetailGenderText, rightMoreinfoText: "${(value.gender==1)?"female":"male"}"),
                HeightBetweenMoreInfoText(),
                MoreInfoText(leftMoreinfoText: kActorDetailPopularityText, rightMoreinfoText: value.popularity.toString()),
                HeightBetweenMoreInfoText(),
               const  ArtistHeading(artistHeading: kActorDetailKnownForText),
                const  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kSP2x),
                  child: Divider(thickness: 2,color: Colors.white,),
                ),
                 MoviesSessionViewWidget(movieSessionViewHeight: kActorDetailMovieSessionHeight,isKnownFor: true,knownForList:knownForList ,)
                  
              ],
                
            ),
          )
          ),
      ),
    );
  }
}

class HeightBetweenMoreInfoText extends StatelessWidget {
  const HeightBetweenMoreInfoText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.02,
              );
  }
}


class ArtistHeading extends StatelessWidget {
  const ArtistHeading({super.key, required this.artistHeading});
  final String artistHeading;
  @override
  Widget build(BuildContext context) {
    return  Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(artistHeading,textAlign: TextAlign.left,
                        style: const TextStyle(color: kPrimaryTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: kActorDeatilArtistHeadingTextFS
                        ),
                        ),
                      ),
                    ),
                  ],
                );
  }
}

class MoreInfoText extends StatelessWidget {
  const MoreInfoText({super.key,required this.leftMoreinfoText,required this.rightMoreinfoText});
  final String leftMoreinfoText;
  final String rightMoreinfoText;
  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                     width: MediaQuery.of(context).size.width*0.35,
                     child: Text(
                         leftMoreinfoText,textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: kSecondaryTextColor,
                              fontSize: kActorDetailMoreInfoTextFS
                            ),
                          ),
                        ),
                      
                       Text(
                         rightMoreinfoText,
                         textAlign:TextAlign.left,
                         style:const  TextStyle(
                           color: kSecondaryTextColor,
                           fontSize: kActorDetailMoreInfoTextFS
                         ),
                       ),
                      ],
                    );
  }
}