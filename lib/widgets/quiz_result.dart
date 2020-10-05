import 'package:flutter/material.dart';
import 'package:shubla/configs/configs.dart';

class QuizResult extends StatelessWidget {
  final int answeredQuestions;
  final int skippedQuestions;
  final Function restart;
  const QuizResult({
    Key key,
    @required this.answeredQuestions,
    @required this.skippedQuestions,
    @required this.restart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // We calculate how many questions were answered and display
    // it as a percentage of total questions
    double efficiency =
        ((answeredQuestions / (answeredQuestions + skippedQuestions)) * 100)
            .floorToDouble();
    // Everything is centered on the scaffold
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Big Number
          Text(
            answeredQuestions.toString(),
            style: TextStyle(
              color: Palette.font,
              fontSize: 46.0,
              fontFamily: 'Georgian',
            ),
          ),
          // Big text under the number
          Text(
            "სწორი პასუხი",
            style: TextStyle(
              color: Palette.font,
              fontSize: 26.0,
              fontFamily: 'Georgian',
            ),
          ),
          // Spacing between big ans small text
          SizedBox(
            height: 10.0,
          ),
          // small text
          Text(
            "შენ გამოიცანი კითხვების $efficiency%",
            style: TextStyle(
              color: Palette.font_light,
              fontSize: 16.0,
              fontFamily: 'Georgian',
            ),
          ),
          // spacing between small text and buttons
          SizedBox(
            height: 40.0,
          ),
          // buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // left button
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 150.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Palette.button_next,
                  ),
                  child: Center(
                    child: Text(
                      "კატეგორიები",
                      style: TextStyle(
                        color: Palette.bg,
                        fontFamily: 'Georgian',
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
              // horizontal spacing between buttons
              SizedBox(
                width: 10.0,
              ),
              // right butotn
              FlatButton(
                onPressed: restart,
                child: Container(
                  width: 150.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Palette.button_skip,
                  ),
                  child: Center(
                    child: Text(
                      "თავიდან",
                      style: TextStyle(
                        color: Palette.bg,
                        fontFamily: 'Georgian',
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
