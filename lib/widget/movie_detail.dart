import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flut_2/constant/color.dart';
import 'package:movie_app_flut_2/constant/dimen.dart';
import 'package:movie_app_flut_2/constant/string.dart';

class MovieDetailHeadTextWidget extends StatelessWidget {
  const MovieDetailHeadTextWidget({super.key,required this.textInMovieDetail});
  final String textInMovieDetail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: kSP30x,
      child: Text(textInMovieDetail,style: const TextStyle(
        fontSize: kMovieDetailTextFS,
        color: kPrimaryTextColor
      ),),
    );
  }
}

class CastAndCrewWidget extends StatelessWidget {
  const CastAndCrewWidget({super.key,required this.topTextCL,required this.botTextCL});
  final String topTextCL;
  final String botTextCL;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                  height: kCastAndCrewSBHeight,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder:(context ,index){
                          return  SizedBox(
                            width: MediaQuery.of(context).size.width*0.38,
                            height: MediaQuery.of(context).size.height*0.2,
                            child: Row(
                             
                              children: [
                  const CircleAvatar(
                    radius: kSP20x,
                    backgroundImage: CachedNetworkImageProvider(kNetworkImage)
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: kSP12x),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(topTextCL,textAlign: TextAlign.left,
                          style:const  TextStyle(
                            color: kPrimaryTextColor,
                            fontSize: kCastAndCrewTopTextFS,
                          
                          ),),
                          Text(botTextCL,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            
                            color: kSecondaryTextColor
                          ),)
                        ],
                      ),
                    )
                              ],
                            ),
                          )
                          ;
                        }
                        ),
                );
  }
}

class ProductionListWidget extends StatelessWidget {
  const ProductionListWidget({super.key,required this.studioName});
  final String studioName;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      height: kProductionListSBHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
       itemCount: 10,
       itemBuilder:(context ,index){
        return SizedBox(
          width: MediaQuery.of(context).size.width*0.4, // to change media qery
          height:MediaQuery.of(context).size.height*0.25,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: kSP25x,
                backgroundImage: CachedNetworkImageProvider(kNetworkImage),
              ),
              Text(studioName,style:const  TextStyle(
                fontSize: kStudioNameTextFS,
                color: kSecondaryTextColor,
              ),)
            ],
          ),
        );
       }),
    );
  }
}