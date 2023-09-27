import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flut_2/constant/color.dart';
import 'package:movie_app_flut_2/constant/dimen.dart';
import 'package:movie_app_flut_2/constant/string.dart';
import 'package:movie_app_flut_2/pages/home_page.dart';

class ActorDetailPage extends StatelessWidget {
  const ActorDetailPage({super.key});
  
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
                title: Text(kActorName,style:const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: kActorDetailActorNameFS
                ),),
                background: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: CachedNetworkImage(imageUrl: kNetworkImage,fit: BoxFit.cover,)),
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
          )
        ]), 
        body: ListView(
          children: [
            const ArtistHeading(artistHeading:kActorDetailBiographyText),
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: kSP2x),
              child: Divider(thickness: 2,color: kDividerColor,),
            ),
               Expanded(
                 child: Text(
                  kMovieDetailText+kMovieDetailText+kMovieDetailText+kMovieDetailText
                  ,style:const TextStyle(
                    color: kSecondaryTextColor,
                    fontSize: kActorDetailBiographyFS,
                  ),
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
            MoreInfoText(leftMoreinfoText: kActorDetailPlaceOfBirthText, rightMoreinfoText: "Newyourk adlasdasdkasoda Newyourk adlasdasdkasoda"),
            HeightBetweenMoreInfoText(),
            MoreInfoText(leftMoreinfoText: kActorDetailBirthdayText, rightMoreinfoText: "18.20.20"),
            HeightBetweenMoreInfoText(),
            MoreInfoText(leftMoreinfoText: kActorDetailDeathdayText, rightMoreinfoText: "32.21.23"),
            HeightBetweenMoreInfoText(),
            MoreInfoText(leftMoreinfoText: kActorDetailGenderText, rightMoreinfoText: "Male"),
            HeightBetweenMoreInfoText(),
            MoreInfoText(leftMoreinfoText: kActorDetailPopularityText, rightMoreinfoText: "21323313"),
            HeightBetweenMoreInfoText(),
           const  ArtistHeading(artistHeading: kActorDetailKnownForText),
            const  Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSP2x),
              child: Divider(thickness: 2,color: Colors.white,),
            ),
             MoviesSessionViewWidget(movieSessionViewHeight: kActorDetailMovieSessionHeight,movieImgae: kNetworkImage,movieName: kMovieName,movieRating: kRating,movieVotes: kVotes,)

          ],
            
        )
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
                      
                       Expanded(
                          child: Text(
                            rightMoreinfoText,
                            textAlign:TextAlign.left,
                            style:const  TextStyle(
                              color: kSecondaryTextColor,
                              fontSize: kActorDetailMoreInfoTextFS
                            ),
                          ),
                        ),
                      ],
                    );
  }
}