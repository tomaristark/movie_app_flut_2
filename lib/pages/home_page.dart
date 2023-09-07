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
    return  Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: const  [
            SearchBarSessionView(),
            MovieGenreSessionView(),
            RecentMovieSessionView(),
            MoviesSessionView(movieSessionViewHeight: kNowPlayingMovieHeight),
            CategoryTextWidget(categoryText: kYouMayLike),
            MoviesSessionView(movieSessionViewHeight: kYouMayLikeMovieHeight),
            CategoryTextWidget(categoryText: kPopular),
            MoviesSessionView(movieSessionViewHeight: kPopularMovieHeight),
            ActorList(),
          ],
        ),
      ),
    );
  }
}

class ActorList extends StatelessWidget {
  const ActorList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kSP20x),
      child: CarouselSlider(options: CarouselOptions(
          height: kActorListHeight,//app specific
          enlargeCenterPage: true,
          viewportFraction: kCarouselVPF,
          enableInfiniteScroll: false,
      ),
      items:[1,2,3,4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
                children: [ClipRRect(
                  borderRadius: BorderRadius.circular(kSP20x),
                  child: SizedBox(
                      width: kActorListHeight,
                      child: CachedNetworkImage(imageUrl:kNetworkImage,
                        fit: BoxFit.fill,
                      )
                  ),
                ),
                  Container(
                    width: kActorListHeight,//app specific
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [kPrimaryColor,kTransparent],
                            begin:  Alignment.bottomCenter,
                            end: Alignment.topCenter)
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(kActorName,style: TextStyle(
                        color: kActorNameColor,
                        fontSize: kActorNameFS,
                        fontWeight: FontWeight.bold

                    ),),
                  )
                ] );
          },
        );
      }).toList(),
      ),
    );
  }
}

class CategoryTextWidget extends StatelessWidget {
  const CategoryTextWidget({
    super.key, required this.categoryText,
  });
  final String categoryText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSP20x),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: kCategoryTextHeight,
        child: Text(categoryText,style: const TextStyle(
          color:kCategoryTextColor,
          fontSize: kCategoryTextFS,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}

class MoviesSessionView extends StatelessWidget {
  const MoviesSessionView({
    super.key, required this.movieSessionViewHeight,
  });
  final double movieSessionViewHeight ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: movieSessionViewHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
          itemBuilder: (context,index){
          return Stack(
            children:[
              SizedBox(
              width: kMoveieSessionViewWidht,//app specific
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
                        fontSize: kNPMovieTitleFS
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
                            fontSize: kNPRateandVoteFS
                          ),),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right: 50),
                          child: Text(kVotes,style: TextStyle(
                            color: kRateAndVoteColor,
                            fontSize: kNPRateandVoteFS
                          ),),
                        )
                      ],
                    )
                  ],
                ),
              )
          ]);
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
                borderRadius: BorderRadius.circular(kSP20x),
                child: SizedBox(
                  width: kRecentMovieWidht,
                  child: CachedNetworkImage(imageUrl:kNetworkImage,
                    fit: BoxFit.fill,
                  )
                ),
              ),
                Container(
                  width: kRecentMovieWidht,//app specific
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

class MovieGenreSessionView extends StatelessWidget {
  const MovieGenreSessionView({
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

class SearchBarSessionView extends StatelessWidget {
  const SearchBarSessionView({
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
