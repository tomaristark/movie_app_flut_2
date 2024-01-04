// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:movie_app_flut_2/data/vos/movie_vo/movie_vo.dart';
import 'package:movie_app_flut_2/pages/actor_detail.dart';
import 'package:movie_app_flut_2/widget/cache_image_widget.dart';

import 'package:provider/provider.dart';

import 'package:movie_app_flut_2/bloc/home_page_bloc.dart';
import 'package:movie_app_flut_2/constant/color.dart';
import 'package:movie_app_flut_2/constant/dimen.dart';
import 'package:movie_app_flut_2/constant/string.dart';

import 'package:movie_app_flut_2/data/vos/movie_genre_vo/movie_genre_vo.dart';

import 'package:movie_app_flut_2/pages/search_page.dart';

import '../data/vos/actor_vo/actor_vo.dart';
import '../widget/movie_widgets.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<HomePageBloc>(
      create: (_)=>HomePageBloc(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children:   [
              const SearchBarSessionView(paddingTop: kSP60x,hasTextField: false,),
              Consumer<HomePageBloc>(
                builder: (context, value, __){
                 return MovieGenreSessionView(genreList: value.movieGenreList);
                },
                ),
              Selector<HomePageBloc,List<MovieVO>?>(      
                selector: (_,bloc)=>bloc.movieByGenre,
                builder: (_,value,__){
                  if(value == null){
                    return const CircularProgressIndicator();
                  }
                  return RecentMovieSessionView(movieVO: value.take(5).toList());
                }),
              Selector<HomePageBloc,List<MovieVO>?>(
                selector: (_,bloc)=> bloc.movieByGenre,
                builder:(_,value,__){
                  if(value != null){
                    var temp = value;
                    temp.removeRange(0, 6);
                    value = temp; 
                  }else if(value == null){
                    return CircularProgressIndicator();
                  }
                  return MoviesSessionViewWidget(movieSessionViewHeight: kNowPlayingMovieHeight,movieList: value,);
                } ),
             const CategoryTextWidget(categoryText: kYouMayLike),
              Selector<HomePageBloc,List<MovieVO>?>(
                selector: (_,bloc)=>bloc.youMayLike,
                builder:(_,value,__){
                    return MoviesSessionViewWidget(movieSessionViewHeight: kYouMayLikeMovieHeight,movieList: value,);
                } ),
              const CategoryTextWidget(categoryText: kPopular),
              Selector<HomePageBloc,List<MovieVO>?>(
                selector: (_,bloc)=>bloc.popular,
                builder:(_,value,__) {
                  if(value == null){
                    return const CircularProgressIndicator();
                  }
                  return MoviesSessionViewWidget(movieSessionViewHeight: kPopularMovieHeight,movieList: value,);}),
              Selector<HomePageBloc,List<ActorVO>?>(
                selector: (_,bloc)=>bloc.actor,
                builder:(_,value,__) {
                  if(value == null){
                    return const CircularProgressIndicator();
                  }
                  return ActorSessionView(actorVO: value,);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class ActorSessionView extends StatelessWidget {
  const ActorSessionView({
    super.key, required this.actorVO,
  });
  final List<ActorVO> ? actorVO;

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
      items:[0,1,2,3,4].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return ActorDetailPage(actorID: actorVO?[i].id??0,knownForList: actorVO?[i].known_for,);
                }));
              },
              child: Stack(
                  children: [ClipRRect(
                    borderRadius: BorderRadius.circular(kSP20x),
                    child: SizedBox(
                        width: kActorListHeight,
                        child: CacheImageWidget(imageUrl: actorVO?[i].profile_path,)
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
                     Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(actorVO?[i].name??"",style: TextStyle(
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



class RecentMovieSessionView extends StatelessWidget {
  const RecentMovieSessionView({
    super.key,required this.movieVO
  });
  final List<MovieVO>? movieVO;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(options: CarouselOptions(
      height: kSP350x,
      autoPlay: true,
      enlargeCenterPage: true,
      viewportFraction: kCarouselVPF
    ),
      items: [0,1,2,3,4].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [ClipRRect(
                borderRadius: BorderRadius.circular(kSP20x),
                child: SizedBox(
                  width: kRecentMovieWidht,
                  child: CacheImageWidget(imageUrl: movieVO?[i].poster_path)
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
  const MovieGenreSessionView({super.key, required this.genreList});

  final List<MovieGenreVO> genreList;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kSP20x),
      child: SizedBox(
        width: double.infinity,
        height: kSP35x,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genreList.length,
          itemBuilder:(context,index){
            return GestureDetector(
              onTap: (){
                // setState(() {
                //    _genreList= _genreList.map((e){
                //     if(e.movieGenre == _genreList[index].movieGenre){
                //       e.isSelected = true;
                //     }else{
                //       e.isSelected = false;
                //     }
          
                //     return e;
                //    }).toList();            
                // });
                // genreList[index].isSelected = true;
                final bloc = context.read<HomePageBloc>();
                bloc.getMovieByGenres(genreList[index].id,index);
                
              },
              child: MovieGenreItemView(movieGenre: genreList[index],),
            );
          } ),

      ),
    );
  }
}

class MovieGenreItemView extends StatelessWidget {
  const MovieGenreItemView({
    super.key,
     required this.movieGenre, 
  });

  final MovieGenreVO movieGenre;
  // final int current;
  // final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: kSP3x),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSP8x),
        color:  (movieGenre.isSelected)?kSecondaryColor:kPrimaryColor,
        //color :(isSelected)?primary color :Secondarycolor
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSP5x,vertical: kSP2x),
        child: Text(movieGenre.name,style: const TextStyle(
          color: kPrimaryTextColor
        ),),
      ),
    );
  }
}

class SearchBarSessionView extends StatelessWidget {
  const SearchBarSessionView({
    super.key, required this.paddingTop,required this.hasTextField,this.onChanged,
  });
  final double paddingTop;
  final bool hasTextField ;
  final Function(String) ? onChanged;
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
                  onChanged:onChanged ,
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
