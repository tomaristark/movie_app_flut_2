import 'package:flutter/material.dart';
import 'package:movie_app_flut_2/constant/color.dart';
import 'package:movie_app_flut_2/constant/dimen.dart';
import 'package:movie_app_flut_2/constant/string.dart';
import 'package:movie_app_flut_2/pages/home_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
           SearchBarSessionView(paddingTop: kSP30x,hasTextField: true,)
         ],
       ),
     ),
    );
  }
}