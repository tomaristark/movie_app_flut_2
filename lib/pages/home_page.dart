import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flut_2/constant/color.dart';
import 'package:movie_app_flut_2/constant/dimen.dart';
import 'package:movie_app_flut_2/constant/string.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SearchBarView(),
          MovieGenreItemView(),
          RecentMovieSessionView(),
          NowPlayingMovieItemView()
        ],
      ),
    );
  }
}

class NowPlayingMovieItemView extends StatelessWidget {
  const NowPlayingMovieItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: kSP200x,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
          itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSP10x),
            child: Stack(
              children:[ SizedBox(
                width: kSP200x,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kSP30x),
                  child:CachedNetworkImage(
                    imageUrl: kNetworkImage,
                    fit: BoxFit.fill,
                  ) ,
                ),
              ),
                const Padding(
                  padding: EdgeInsets.only(top: kSP130x,left: kSP10x),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: kSP10x,bottom: kSP10x),
                        child: Text(kMovieName,style: TextStyle(
                          color: kMovieTitle,
                          fontWeight: FontWeight.w700,
                          fontSize: kNPMovieTitlefs
                        ),),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(right:kSP3x),
                            child: Icon(Icons.star_border_outlined,color: kStarColor,),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(right: kSP40x),
                            child: Text(kRating,style: TextStyle(
                              color: kRateAndVoteColor,
                              fontSize: kNPRateandVotefs
                            ),),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(right: kSP60x),
                            child: Text(kVotes,style: TextStyle(
                              color: kRateAndVoteColor,
                              fontSize: kNPRateandVotefs
                            ),),
                          )
                        ],
                      )
                    ],
                  ),
                )
            ]),
          );
          }),
    );
  }
}

class RecentMovieSessionView extends StatelessWidget {
  const RecentMovieSessionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(options: CarouselOptions(
      height: kSP350x,
      autoPlay: true,
      enlargeCenterPage: true,
      viewportFraction: kCarouselVPF
    ),
      items: [1,2,3,4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: kSP350x,
                  child: CachedNetworkImage(imageUrl:kNetworkImage,
                    fit: BoxFit.fill,
                  )
                ),
              ),
                Container(
                  width: kSP350x,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [kPrimaryColor,kTransparent],
                    begin:  Alignment.bottomCenter,
                    end: Alignment.topCenter)
                  ),
                ),
                Center(
                  child: Container(
                    width: kSP40x,
                    height: kSP40x,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kSecondaryColor,
                    ),
                    child:const Icon(Icons.play_arrow_outlined,color: kPlayIconColor,),
                  ),
                )
           ] );
          },
        );
      }).toList(),
    );
  }
}

class MovieGenreItemView extends StatelessWidget {
  const MovieGenreItemView({
    super.key,
  });
 final bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kSP20x),
      child: SizedBox(
        width: double.infinity,
        height: kSP35x,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kMovieGenreList.length,
          itemBuilder:(context,index){
            String currentItem =kMovieGenreList[index];
            return GestureDetector(
              onTap: (){
                // isSelected =true;
                print("$currentItem");
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: kSP3x),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kSP8x),
                  color: (currentItem =="Adventure")?kSecondaryColor:kPrimaryColor,
                  //color :(isSelected)?primary color :Secondarycolor
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kSP5x,vertical: kSP2x),
                  child: Text(currentItem,style: const TextStyle(
                    color: kMovieGenreColor
                  ),),
                ),
              ),
            );
          } ),

      ),
    );
  }
}

class SearchBarView extends StatelessWidget {
  const SearchBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kSP60x,left: kSP10x,right: kSP10x,bottom: kSP20x),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.7,
            height: kSP62x,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSP20x),
              color: kSearchBarColor,
            ),
            child: const Padding(
              padding:  EdgeInsets.only(top: kSP22x,left: kSP10x),
              child:  Text(kSearchMovie,style: TextStyle(
                color:  kSearchHintText
              ),),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width* 0.16,
            height: kSP60x,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.circular(kSP12x)
            ),
            child: const Icon(Icons.search,size: kSearchIcon,color:kSearchIconColor,),
          )
        ],
      ),
    );
  }
}
