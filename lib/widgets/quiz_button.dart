import 'package:flutter/cupertino.dart';
import '../configs/configs.dart';

// Skip and +1 buttons on the left and right side of the screen
class QuizButton extends StatelessWidget {
  // Color is the background color of the button
  final Color color;
  // What icon should user see
  final IconData icon;
  // What text is under the icon
  final String text;
  // Border radius direction, for the left button it is on the right side
  // and for the right button it is on the left side
  final String radiusDirection;
  // Function - what happens when user taps on the button
  final Function onTap;
  // Initialisation
  const QuizButton({
    Key key,
    @required this.color,
    @required this.icon,
    @required this.text,
    @required this.radiusDirection,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It let us use relative sizes, ex: 40% of the width
    SizeConfig().init(context);
    return GestureDetector(
      // Function from the parent widget
      onTap: onTap,
      // Colorful container
      child: Container(
        // Width is 20% and height is 100%
        width: SizeConfig.safeBlockHorizontal * 20,
        height: SizeConfig.safeBlockHorizontal * 100,
        // Background color and rhe radius
        // Where radius is depends on the 'radiusDirection'
        decoration: BoxDecoration(
          color: color,
          borderRadius: getRadius(radiusDirection),
        ),
        // Column where icon and text is populated
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40.0),
            Text(text),
          ],
        ),
      ),
    );
  }

  // Border radius direction, for the left button it is on the right side
  // and for the right button it is on the left side. This function returns
  // border radius depending on the direction widget gets.
  BorderRadius getRadius(direction) {
    if (direction == 'left') {
      return BorderRadius.only(
        topLeft: Radius.circular(SizeConfig.safeBlockHorizontal * 40),
        bottomLeft: Radius.circular(SizeConfig.safeBlockHorizontal * 40.0),
      );
    } else {
      return BorderRadius.only(
        topRight: Radius.circular(SizeConfig.safeBlockHorizontal * 40),
        bottomRight: Radius.circular(SizeConfig.safeBlockHorizontal * 40.0),
      );
    }
  }
}
