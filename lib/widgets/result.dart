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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Result: $answeredQuestions / $totalQuestions'),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: () {},
                color: Colors.green,
                textColor: Colors.black,
                padding: EdgeInsets.all(20.0),
                child: Text("Restart"),
              ),
              SizedBox(width: 30.0),
              FlatButton(
                onPressed: () {},
                color: Colors.yellow,
                textColor: Colors.black,
                padding: EdgeInsets.all(20.0),
                child: Text("Categories"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
