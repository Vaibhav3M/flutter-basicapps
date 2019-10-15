import 'package:flutter/material.dart';

import 'package:quiz_app/Questions.dart';
import 'package:quiz_app/Answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {

    return HomePageState();
  }

}

class HomePageState extends State<HomePage>{

  var _questionIndex = 0;

  void _answerQuestion(){
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {


    var questions = [
      {
        "questionText" : "What's your favourite Color?",
        "answerList" : ['Red','Yellow','Green','Blue'],
      },
      {
        "questionText" : "What's is your favourite Animal?",
        "answerList" : ['Rabbit','Snake','Elephant','Dog'],
      },
      {
        "questionText" : "What's is your favourite Food?",
        "answerList" : ['Pizza','Oats','Burger','Pasta'],
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Quiz Demo"),
      ),
      body: Column(

        children: <Widget>[
          Question(
            questions[_questionIndex]["questionText"],
          ),
          ...(questions[_questionIndex]['answerList'] as List<String>).map((answer) {
              return Answer(_answerQuestion,answer);
          }).toList(),
        ],
      ),
    );
  }
}