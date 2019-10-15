import 'package:flutter/material.dart';

import 'package:quiz_app/Questions.dart';
import 'package:quiz_app/Answer.dart';

class Quiz extends StatelessWidget {

  final int questionIndex;
  final List<Map<String, Object>>questions;
  final Function answerQuestion;
  var score = 0;

  Quiz({@required this.questions,
      @required this.questionIndex,
      @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
            Question(
              questions[questionIndex]["questionText"],
            ),
            ...(questions[questionIndex]['answerList'] as List<Map<String,Object>>).map((answer) {
              return Answer(() => answerQuestion(answer['score']),answer['text']);
            }).toList(),
          ],
        );
  }
}
