import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shubla/configs/configs.dart';

// Skip and next buttons on the left and right side of the screen
class QuizButton extends StatelessWidget {
  // if its -1 then left alignment, if its 1 then right alignment
  final int align;
  // Color is the background color of the button
  final Color color;
  // What text is under the icon
  final String text;
  // Border radius direction, for the left button it is on the right side
  // and for the right button it is on the left side
  // final String radiusDirection;
  // Function - what happens when user taps on the button
  final Function onTap;
  // Initialisation
  const QuizButton({
    Key key,
    @required this.align,
    @required this.color,
    @required this.text,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It let us use relative sizes, ex: 40% of the width
    SizeConfig().init(context);
    var height = SizeConfig.blockSizeVertical * 70;
    // Returns border radius direction for the container
    BorderRadius getBorderRadius(align) {
      if (align == -1) {
        return BorderRadius.only(
          topRight: Radius.circular(height / 2),
          bottomRight: Radius.circular(height / 2),
        );
      } else {
        return BorderRadius.only(
          topLeft: Radius.circular(height / 2),
          bottomLeft: Radius.circular(height / 2),
        );
      }
    }

    // GestureDetector takes the on Tap event and trigers onTap function
    return GestureDetector(
      onTap: onTap,
      // Button should be aligned on the center left or center right
      // it depends if its skip button or next button
      child: Align(
        alignment: align == -1 ? Alignment.centerLeft : Alignment.centerRight,
        child: Container(
          height: height,
          width: height / 2,
          decoration: new BoxDecoration(
              color: color, borderRadius: getBorderRadius(align)),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontFamily: 'Georgian',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
