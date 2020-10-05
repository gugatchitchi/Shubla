import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:shubla/configs/configs.dart';
import 'package:shubla/widgets/widgets.dart';
import 'dart:math';
import 'dart:async';

// Widget has two main views: a question and a result
// if user has more questions two answer widget will return
// question and if there are none left it returns result
class Quiz extends StatefulWidget {
  final List<String> questions;
  Quiz({Key key, @required this.questions}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // We save quiz results in here
  int _skippedQuestions = 0;
  int _answeredQuestions = 0;

  // these are the questions we want to ask to user
  List<String> _randomQuestions = [];

  // we want user to see questions randomly every time one chooses the category
  // therefore we use random library and function below to generate questions
  // list rendomly
  final _random = new Random();
  // generates positive integer between min and max values
  int next(int min, int max) => min + _random.nextInt(max - min);
  // function that generates questions list randomly
  List<String> getQuestions() {
    // we save indexes, so no question can reapear in the list
    List<int> usedQuestions = [];
    // questions we want to ask to user
    List<String> questionsToAsk = [];
    // length of the questions data
    var max = widget.questions.length;
    // add questions to the list randomly
    while (usedQuestions.length != max) {
      var id = next(0, max);
      if (!usedQuestions.contains(id)) {
        usedQuestions.add(id);
        questionsToAsk.add(widget.questions[id]);
      }
    }
    return questionsToAsk;
  }

  // initilize timer
  Timer _timer;
  // how many seconds should timer go
  int _timeLeft = 60;
  // start the timer
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_timeLeft < 1) {
            timer.cancel();
            print('timer over');
          } else {
            _timeLeft = _timeLeft - 1;
            print("time left: $_timeLeft");
          }
        },
      ),
    );
  }

  // Start the timer and create questions list
  @override
  void initState() {
    _randomQuestions = getQuestions();
    startTimer();
    super.initState();
  }

  // Dispose everything
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Enforce landscape oriantation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    // It let us use relative sizes, ex: 40% of the width
    SizeConfig().init(context);
    // return a widget
    return Scaffold(
      backgroundColor: Palette.bg,
      body: Stack(children: [
        Positioned(
          right: (SizeConfig.safeBlockHorizontal * 100 - 60) / 60 * _timeLeft,
          bottom: 0.0,
          child: QuizTimer(
            secondsLeft: _timeLeft,
          ),
        ),
        Question(
          question:
              _randomQuestions.length > _skippedQuestions + _answeredQuestions
                  ? _randomQuestions[_skippedQuestions + _answeredQuestions]
                  : 'მეტი შეკითხვა აღარ გვაქვს',
          onTapSkip: () {
            setState(() {
              _skippedQuestions++;
            });
          },
          onTapNext: () {
            setState(() {
              _answeredQuestions++;
            });
          },
        ),
      ]),
    );
  }
}
