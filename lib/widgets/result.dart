import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final totalQuestions;
  final answeredQuestions;
  final skippedQuestions;
  const Result({
    Key key,
    @required this.totalQuestions,
    @required this.answeredQuestions,
    @required this.skippedQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Result: $answeredQuestions / $totalQuestions'),
    );
  }
}
