import 'package:flutter/material.dart';

import 'package:quiz_app/Questions.dart';
import 'package:quiz_app/Answer.dart';

class Quiz extends StatelessWidget {

  final questionIndex;
  final questions;
  final Function answerQuestion;

  Quiz(this.questions,this.questionIndex,this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
            Question(
              questions[questionIndex]["questionText"],
            ),
            ...(questions[questionIndex]['answerList'] as List<String>).map((answer) {
              return Answer(answerQuestion,answer);
            }).toList(),
          ],
        );
  }
}
