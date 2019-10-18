import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final int score;
  final Function resetQuiz;

  Result(this.score, this.resetQuiz);

  String get resultPhase {
      var resultText = "You did it!!!!";

      if(score > 10){
        resultText = "You are awesome!!";
      }

      return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        widthFactor: double.infinity,
        child: Column(
          children: <Widget>[
          Text(
          resultPhase,
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
        ),
          Text(
            "Your score is $score"
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: FlatButton(
              child: Text("Restart Quiz"),
              color: Colors.green,
              onPressed: resetQuiz,
            ),
          )
          ]
      ),
      ),
    );

  }
}
