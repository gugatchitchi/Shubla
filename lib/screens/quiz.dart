import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/widgets.dart';
import '../database/data.dart';

// Widget has two main views: a question and a result
// if user has more questions two answer widget will return
// question and if there are none left it returns result
class Quiz extends StatefulWidget {
  Quiz({Key key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // We save quiz results in here
  int _questionNum = 0;
  int _skippedQuestions = 0;
  int _answeredQuestions = 0;

  @override
  Widget build(BuildContext context) {
    // Enforce landscape oriantation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    // Returns the widget user should see
    // if there are questions left it would be a question
    // widget, if not it should be a result widget
    Widget whatShouldUserSee(id, questions) {
      if (questions.length > id) {
        return Question(
          question: questions[id],
          skip: () {
            setState(() {
              _questionNum++;
              _skippedQuestions++;
            });
          },
          next: () {
            setState(() {
              _questionNum++;
              _answeredQuestions++;
            });
          },
        );
      } else {
        return Result(
          totalQuestions: countries.length,
          answeredQuestions: _answeredQuestions,
          skippedQuestions: _skippedQuestions,
        );
      }
    }

    // return a widget
    return whatShouldUserSee(_questionNum, countries);
  }
}
