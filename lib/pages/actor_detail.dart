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
                title: Text(kActorName,style:TextStyle(
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
            ArtistHeading(artistHeading:kActorDetailBiographyText),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSP2x),
              child: Divider(thickness: 2,color: kDividerColor,),
            ),
            Container(
              child: Text(
                kMovieDetailText+kMovieDetailText+kMovieDetailText
                ,style: TextStyle(
                  color: kSecondaryTextColor,
                  fontSize: kActorDetailBiographyFS,
                ),
              ),

            ),
            
            Padding(
              padding: const EdgeInsets.only(top: kSP20x),
              child: ArtistHeading(artistHeading: kActorDetailMoreInformationText),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Divider(thickness: 2,color: kDividerColor,),
            ),
            MoreInfoText(leftMoreinfoText: kActorDetailPlaceOfBirthText, rightMoreinfoText: "Newyourk adlasdasdkasoda"),
            HeightBetweenMoreInfoText(),
            MoreInfoText(leftMoreinfoText: kActorDetailBirthdayText, rightMoreinfoText: "18.20.20"),
            HeightBetweenMoreInfoText(),
            MoreInfoText(leftMoreinfoText: kActorDetailDeathdayText, rightMoreinfoText: "32.21.23"),
            HeightBetweenMoreInfoText(),
            MoreInfoText(leftMoreinfoText: kActorDetailGenderText, rightMoreinfoText: "Male"),
            HeightBetweenMoreInfoText(),
            MoreInfoText(leftMoreinfoText: kActorDetailPopularityText, rightMoreinfoText: "21323313"),
            HeightBetweenMoreInfoText(),
            ArtistHeading(artistHeading: kActorDetailKnownForText),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSP2x),
              child: Divider(thickness: 2,color: Colors.white,),
            ),
             MoviesSessionViewWidget(movieSessionViewHeight: kActorDetailMovieSessionHeight)

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
                        style: TextStyle(color: kPrimaryTextColor,
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
                children: [
                  Container(
                     width: MediaQuery.of(context).size.width*0.35,
                     child: Text(
                         leftMoreinfoText,textAlign: TextAlign.left,
                            style: TextStyle(
                              color: kSecondaryTextColor,
                              fontSize: kActorDetailMoreInfoTextFS
                            ),
                          ),
                        ),
                      
                       Container(
                          child: Text(
                            rightMoreinfoText,
                            textAlign:TextAlign.left,
                            style: TextStyle(
                              color: kSecondaryTextColor,
                              fontSize: kActorDetailMoreInfoTextFS
                            ),
                          ),
                        ),
                      ],
                    );
  }
}