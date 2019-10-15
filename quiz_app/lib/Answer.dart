import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final String answer;
  //callback function - creating a function object to access the function in Main class widget
  final Function funcHandler;

  //constructor
  Answer(this.funcHandler, String this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(answer),
        onPressed: funcHandler,
      ),
    );
  }
}
