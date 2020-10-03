import 'package:flutter/material.dart';
import 'widgets.dart';

class Question extends StatelessWidget {
  // what question hould user see and what happens
  // after user presses on the button
  final String question;
  final Function skip;
  final Function next;
  const Question({
    Key key,
    @required this.question,
    @required this.skip,
    @required this.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Row has 3 children: button - question text - button
    return Row(
      children: [
        // left button
        // on press user should skip the question
        QuizButton(
          color: Colors.yellow,
          icon: Icons.skip_next,
          text: 'skip',
          radiusDirection: 'right',
          onTap: skip,
        ),
        // the question text in the middle
        Expanded(
          child: Container(
            child: Text(
              question,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26.0,
              ),
            ),
          ),
        ),
        // rigth button
        // on press user gets a point and a new question
        QuizButton(
          color: Colors.green,
          icon: Icons.plus_one,
          text: 'success',
          radiusDirection: 'left',
          onTap: next,
        ),
      ],
    );
  }
}
