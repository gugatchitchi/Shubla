import 'package:flutter/material.dart';

class QuizTimer extends StatelessWidget {
  final int secondsLeft;
  const QuizTimer({Key key, @required this.secondsLeft}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 60.0;
    int colorR = (255 - 255 / 60 * secondsLeft).toInt();
    int colorB = (255 / 60 * secondsLeft).toInt();
    return Container(
      width: height,
      height: height / 2,
      // child: Center(child: Text(secondsLeft.toString())),
      decoration: new BoxDecoration(
        color: Color.fromRGBO(colorR, 200, colorB, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(height / 2),
          topRight: Radius.circular(height / 2),
        ),
      ),
    );
  }
}
