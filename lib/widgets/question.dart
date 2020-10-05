import 'package:flutter/material.dart';
import 'package:shubla/configs/configs.dart';
import 'package:shubla/widgets/widgets.dart';

class Question extends StatelessWidget {
  final String question;
  final Function onTapSkip;
  final Function onTapNext;
  final int timeLeft;
  const Question({
    Key key,
    @required this.question,
    @required this.onTapSkip,
    @required this.onTapNext,
    @required this.timeLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        right: (SizeConfig.safeBlockHorizontal * 100 - 60) / 60 * timeLeft,
        bottom: 0.0,
        child: QuizTimer(
          secondsLeft: timeLeft,
        ),
      ),
      Row(
        children: [
          QuizButton(
            align: -1,
            color: Palette.button_skip,
            text: 'გამოტოვება',
            onTap: onTapSkip,
          ),
          Expanded(
            child: Text(
              question,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Palette.font,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          QuizButton(
            align: 1,
            color: Palette.button_next,
            text: 'შემდეგი',
            onTap: onTapNext,
          ),
        ],
      )
    ]);
  }
}
