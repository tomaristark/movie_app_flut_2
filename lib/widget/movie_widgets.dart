import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flut_2/constant/api_constant.dart';
import 'package:movie_app_flut_2/constant/color.dart';
import 'package:movie_app_flut_2/constant/dimen.dart';

import 'package:movie_app_flut_2/data/vos/cast_crew_vo/cast_vo/cast_vo.dart';
import 'package:movie_app_flut_2/data/vos/cast_crew_vo/crew_vo/crew_vo.dart';
import 'package:movie_app_flut_2/errors/error_widget.dart';

import '../data/vos/actor_vo/known_for/known_for.dart';
import '../data/vos/movie_details/production_companies_vo/production_companies_vo.dart';
import '../data/vos/movie_vo/movie_vo.dart';
import '../pages/movie_detail.dart';

class MovieDetailHeadTextWidget extends StatelessWidget {
  const MovieDetailHeadTextWidget({super.key, required this.textInMovieDetail});
  final String textInMovieDetail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: kSP30x,
      child: Text(
        textInMovieDetail,
        style: const TextStyle(
            fontSize: kMovieDetailTextFS, color: kPrimaryTextColor),
      ),
    );
  }
}

class CastAndCrewWidget extends StatelessWidget {
  const CastAndCrewWidget(
      {super.key, this.isCast = true, this.castVO, this.crewVO});

  final bool isCast;
  final List<CastVO>? castVO;
  final List<CrewVO>? crewVO;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kCastAndCrewSBHeight,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: (isCast) ? castVO?.length ?? 0 : crewVO?.length ?? 0,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  CircleAvatar(
                      radius: kSP20x,
                      backgroundImage: CachedNetworkImageProvider(
                          "$kBaseImageUrl${(isCast) ? castVO![index].profile_path ?? "" : crewVO?[index].profile_path ?? ""}")),
                  Padding(
                    padding: const EdgeInsets.only(left: kSP12x),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${(isCast) ? castVO![index].character ?? "" : crewVO?[index].job ?? ""}",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: kPrimaryTextColor,
                            fontSize: kCastAndCrewTopTextFS,
                          ),
                        ),
                        Text(
                          "${(isCast) ? castVO![index].name ?? "" : crewVO?[index].name ?? ""}",
                          textAlign: TextAlign.left,
                          style: const TextStyle(color: kSecondaryTextColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class ProductionListWidget extends StatelessWidget {
  const ProductionListWidget({super.key, required this.productionList});
  final List<ProductionCompaniesVO>? productionList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: kProductionListSBHeight,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productionList?.length??0,
          itemBuilder: (context, index) {
            return SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.4, // to change media qery
              height: MediaQuery.of(context).size.height * 0.26,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: kSP25x,
                    backgroundImage: CachedNetworkImageProvider(
                        "$kBaseImageUrl${productionList?[index].logo_path ?? ""}"),
                  ),
                  Expanded(
                    child: Text(
                      productionList?[index].name ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: kStudioNameTextFS,
                        color: kSecondaryTextColor,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class MoviesSessionViewWidget extends StatelessWidget {
  const MoviesSessionViewWidget(
      {super.key,
      required this.movieSessionViewHeight,
      this.movieList,
      this.knownForList,
      this.isKnownFor = false});
  final double movieSessionViewHeight;
  final bool isKnownFor;
  final List<MovieVO>? movieList;
  final List<KnownForVO>? knownForList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: movieSessionViewHeight, // k
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          scrollDirection: Axis.horizontal,
          itemCount:
              (isKnownFor) ? knownForList?.length ?? 0 : movieList?.length ?? 0,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return MovieDetailPage(
                      movieID: (isKnownFor)
                          ? knownForList![index].id ?? 0
                          : movieList?[index].id ?? 0);
                }));
              },
              child: Stack(children: [
                SizedBox(
                  width: kMovieSessionViewWidth, //app specific
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(kSP30x),
                    child: CachedNetworkImage(
                      errorWidget: (context, url, error) => PhotoErrorWidget(),
                      placeholder: (context, url) => PhotoErrorWidget(),
                      imageUrl:
                          "$kBaseImageUrl${(isKnownFor) ? knownForList![index].poster_path ?? "" : movieList?[index].poster_path ?? ""}",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: kSP10x),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: kSP10x, bottom: kSP5x),
                        child: SizedBox(
                          width: kMovieSessionViewTextSBWidth,
                          child: Text(
                            "${(isKnownFor) ? knownForList![index].title ?? "" : movieList?[index].title ?? ""}",
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                color: kPrimaryTextColor,
                                fontWeight: FontWeight.w700,
                                fontSize: kNPMovieTitleFS),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: kSP3x),
                            child: Icon(
                              Icons.star_border_outlined,
                              color: kStarColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: kSP40x),
                            child: Text(
                              "${(isKnownFor) ? knownForList![index].vote_average.toString() ?? "" : movieList?[index].vote_average.toString() ?? ""}",
                              style: TextStyle(
                                  color: kRateAndVoteColor,
                                  fontSize: kNPRateandVoteFS),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              "${(isKnownFor) ? knownForList![index].vote_count.toString() ?? "" : movieList?[index].vote_count.toString() ?? ""}" +
                                  " votes",
                              style: TextStyle(
                                  color: kRateAndVoteColor,
                                  fontSize: kNPRateandVoteFS),
                            ),
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
