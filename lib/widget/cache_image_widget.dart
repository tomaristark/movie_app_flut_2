import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flut_2/errors/error_widget.dart';

import '../constant/api_constant.dart';

class CacheImageWidget extends StatelessWidget {
  const CacheImageWidget({super.key, required this.imageUrl});

  final String ? imageUrl;

  @override
  Widget build(BuildContext context) {
    return(imageUrl != null ) ?CachedNetworkImage(
      imageUrl: "$kBaseImageUrl$imageUrl",fit: BoxFit.cover ,
      progressIndicatorBuilder: (context, url, progress) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const PhotoErrorWidget(),
      ):const PhotoErrorWidget();

  }
}