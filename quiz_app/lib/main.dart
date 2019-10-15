import 'package:flutter/material.dart';

import 'package:quiz_app/Quiz.dart';
import 'package:quiz_app/Result.dart';

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

  final questions = const [
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


  void _answerQuestion(){

    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Quiz Demo"),
      ),
      // added check for length of question - display widget in respect to that
      body: _questionIndex < questions.length ? Quiz(questions, _questionIndex, _answerQuestion): Result(),
    );
  }
}