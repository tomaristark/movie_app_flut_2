import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flut_2/constant/color.dart';
import 'package:movie_app_flut_2/constant/dimen.dart';
import 'package:movie_app_flut_2/constant/string.dart';
import 'package:movie_app_flut_2/data/movie_genre_vo.dart';
import 'package:movie_app_flut_2/pages/actor_detail.dart';
import 'package:movie_app_flut_2/pages/movie_detail.dart';
import 'package:movie_app_flut_2/pages/search_page.dart';
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
            SearchBarSessionView(paddingTop: kSP60x,hasTextField: false,),
            MovieGenreSessionView(),
            RecentMovieSessionView(),
            MoviesSessionViewWidget(movieSessionViewHeight: kNowPlayingMovieHeight),
            CategoryTextWidget(categoryText: kYouMayLike),
            MoviesSessionViewWidget(movieSessionViewHeight: kYouMayLikeMovieHeight),
            CategoryTextWidget(categoryText: kPopular),
            MoviesSessionViewWidget(movieSessionViewHeight: kPopularMovieHeight),
            ActorSessionView(),
          ],
        ),
      ),
    );
  }
}

class ActorSessionView extends StatelessWidget {
  const ActorSessionView({
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
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return ActorDetailPage();
                }));
              },
              child: Stack(
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
                          color: kPrimaryTextColor,
                          fontSize: kActorNameFS,
                          fontWeight: FontWeight.bold
            
                      ),),
                    )
                  ] ),
            );
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
          color:kPrimaryTextColor,
          fontSize: kCategoryTextFS,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}

class MoviesSessionViewWidget extends StatelessWidget {
  const MoviesSessionViewWidget({
    super.key, required this.movieSessionViewHeight,
  });
  final double movieSessionViewHeight ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: movieSessionViewHeight, // k
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
          itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return MovieDetailPage();
              }));
            },
            child: Stack(
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: kSP10x,bottom: kSP10x),
                        child: Text(kMovieName,style: TextStyle(
                          color: kPrimaryTextColor,
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

class MovieGenreSessionView extends StatefulWidget {
  const MovieGenreSessionView({
    super.key,
  });

  @override
  State<MovieGenreSessionView> createState() => _MovieGenreSessionViewState();
}

class _MovieGenreSessionViewState extends State<MovieGenreSessionView> {
   List<MovieGenreVO> _genreList=[];
   int current  = 0;


@override
  void initState() {
        _genreList = List.generate(kMovieGenreList.length, (index) =>MovieGenreVO(kMovieGenreList[index])).toList();
        _genreList [0].isSelected= true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kSP20x),
      child: SizedBox(
        width: double.infinity,
        height: kSP35x,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _genreList.length,
          itemBuilder:(context,index){
            return GestureDetector(
              onTap: (){
                setState(() {
                      current =index;                   
                });
              },
              child: MovieGenreItemView(movieGenre: _genreList[index],current: current,index: index,),
            );
          } ),

      ),
    );
  }
}

class MovieGenreItemView extends StatelessWidget {
  const MovieGenreItemView({
    super.key,
     required this.movieGenre, required this.current, required this.index,
  });

  final MovieGenreVO movieGenre;
  final int current;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: kSP3x),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSP8x),
        color:  (current==index)?kSecondaryColor:kPrimaryColor,
        //color :(isSelected)?primary color :Secondarycolor
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSP5x,vertical: kSP2x),
        child: Text(movieGenre.movieGenre,style: const TextStyle(
          color: kPrimaryTextColor
        ),),
      ),
    );
  }
}

class SearchBarSessionView extends StatelessWidget {
  const SearchBarSessionView({
    super.key, required this.paddingTop,required this.hasTextField,
  });
  final double paddingTop;
  final bool hasTextField ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: paddingTop,left: kSP10x,right: kSP10x,bottom: kSP20x),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.75,
            height: kSP62x,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSP20x),
              color: kSearchBarColor,
            ),
            child:  Padding(
              padding: const  EdgeInsets.only(top: kSP22x,left: kSP10x),
              child: (hasTextField)? Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: kSearchMovie,
                    hintStyle: TextStyle(
                      color: kSecondaryTextColor
                    ),
                    
                  ),
                ),
              )
              :const Text(kSearchMovie,style: TextStyle(
                color:  kSecondaryTextColor
              ),)

            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context){
                  return const SearchPage();
                })
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width* 0.16,
              height: kSP57x,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(kSP12x)
              ),
              child: const Icon(Icons.search,size: kSearchIcon,color:kSearchIconColor,),
            ),
          )
        ],
      ),
    );
  }
}
