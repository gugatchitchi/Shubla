import 'package:flutter/material.dart';
import 'package:shubla/configs/configs.dart';

class CategoriesTitle extends StatelessWidget {
  // title is the big text on the category page
  // and descrip is small text under the title
  final String title;
  final String descrip;
  const CategoriesTitle({
    Key key,
    @required this.title,
    @required this.descrip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It let us use relative sizes, ex: 40% of the width
    SizeConfig().init(context);
    return Container(
      // to align text horizontaly it should strech
      // the whole horizontal space
      width: SizeConfig.blockSizeHorizontal * 100,
      child: Column(
        children: [
          // Title - big text on the top
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Palette.font,
              fontWeight: FontWeight.bold,
              fontFamily: 'Georgian',
              fontSize: 36.0,
            ),
          ),
          // Descrip - small text on the bottom
          Text(
            descrip,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Palette.font_light,
              fontFamily: 'Georgian',
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
