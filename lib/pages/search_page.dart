

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flut_2/bloc/search_page_bloc.dart';
import 'package:movie_app_flut_2/constant/color.dart';
import 'package:movie_app_flut_2/constant/dimen.dart';
import 'package:movie_app_flut_2/constant/string.dart';
import 'package:movie_app_flut_2/errors/error_widget.dart';
import 'package:provider/provider.dart';

import '../data/vos/movie_vo/movie_vo.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchPageBloc>(
      create: (_)=>SearchPageBloc(),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
       body: Padding(
         padding: const EdgeInsets.only(top: kSP100x),
         child: Column(
          mainAxisSize: MainAxisSize.min,
           children: [
             GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
               child: const Row(
                children: [
                  Icon(Icons.chevron_left, color:kSecondaryColor ,),
                  Text(kSearchPaegBackText,style: TextStyle(
                    color: kSecondaryColor
                  ),)
                ],
               ),
             ),
             Padding(
               padding:  EdgeInsets.only(top: kSP60x,left: kSP10x,right: kSP10x,bottom: kSP20x),
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
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  onChanged:(String keyword){
                   final bloc = context.read<SearchPageBloc>();
                   bloc.getMovie(keyword);
                  } ,
                  decoration: InputDecoration(
                    
                    border: InputBorder.none,
                    hintText: kSearchMovie,
                    hintStyle: TextStyle(
                      color: kSecondaryTextColor
                    ),
                    
                  ),
                ),
              )
              
         
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
             ),
             Selector<SearchPageBloc,List<MovieVO>?>(
              selector: (_,bloc)=> bloc.movieBySearch,
               builder:(_,value,__) => MovieBySearchView(
                movieVO: value,
               ),
             )
                
           ],
         ),
       ),
      ),
    );
  }
}

class MovieBySearchView extends StatelessWidget {
  const MovieBySearchView({
    super.key, required this.movieVO,
  });

  final List<MovieVO> ? movieVO;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
     child: ListView.separated(
       separatorBuilder: (context,index)=>const SizedBox(height: 20,),
       padding: EdgeInsets.zero,
       itemCount: movieVO?.length ??0,
       itemBuilder: (context,index)=> Padding(
           padding: const EdgeInsets.symmetric(horizontal: kSP10x),
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisSize:  MainAxisSize.min,
             children: [
               SizedBox(
                 width: kSP100x,
                 height: kSP120x,
                 child:CachedNetworkImage(
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => PhotoErrorWidget(),
                  imageUrl: movieVO?[index].poster_path??""),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: kSP10x,horizontal: kSP10x),
                 child: SizedBox(
                   height: kSP110x,
                   child: Column(
                     
                     mainAxisSize: MainAxisSize.max,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(movieVO?[index].original_title??"",
                       maxLines: 3,
                       style: TextStyle(
                         color: kPrimaryTextColor,
                         fontSize: kMovieBySearchTitleFS
                       ),),
                       Row(
                           children: [
                             Padding(
                               padding:  EdgeInsets.only(right:kSP3x),
                               child: Icon(Icons.star_border_outlined,color: kStarColor,),
                             ),
                             Padding(
                               padding:  EdgeInsets.only(right: kSP40x),
                               child: Text(movieVO?[index].vote_average.toString()??"",style: TextStyle(
                                 color: kRateAndVoteColor,
                                 fontSize: kNPRateandVoteFS
                               ),),
                             ),
                             Padding(
                               padding:EdgeInsets.only(right: 10),
                               child: Text("Realease Date:${movieVO?[index].release_date.toString()??""}",style: TextStyle(
                                 color: kRateAndVoteColor,
                                 fontSize: kNPRateandVoteFS
                               ),),
                             )
                           ],
                         )
                     ],
                   ),
                 ),
               )
             ],
           ),
         )
         
       )
       );
  }
}