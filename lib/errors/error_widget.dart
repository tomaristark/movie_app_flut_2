

import 'package:flutter/material.dart';
import 'package:movie_app_flut_2/constant/string.dart';

class PhotoErrorWidget extends StatelessWidget {
  const PhotoErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(kErrorImage,
    fit: BoxFit.fill,
    );
  }
}