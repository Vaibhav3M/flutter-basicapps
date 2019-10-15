import 'package:flutter/material.dart';

class Question extends StatelessWidget {

  // getting value for question
  String question;

  //constructor for question
  Question(this.question);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(2.0),
      child: Text(
        question,
        style: TextStyle(fontSize: 23),
        textAlign: TextAlign.center,
      ),
    );
  }
}
