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

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var _questionIndex = 0;
  var _totalScore =0;

  final questions = const [
    {
      "questionText": "What's your favourite Color?",
      "answerList": [
        {'text': 'Red', 'score': 10},
        {'text': 'Yellow', 'score': 15},
        {'text': 'Green', 'score': 20},
        {'text': 'Blue', 'score': 15}
      ],
    },
    {
      "questionText": "What's is your favourite Animal?",
      "answerList": [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 5},
        {'text': 'Elephant', 'score': 20},
        {'text': 'Dog', 'score': 30}
      ],
    },
    {
      "questionText": "What's is your favourite Food?",
      "answerList": [
        {'text': 'Pizza', 'score': 10},
        {'text': 'Oats', 'score': 30},
        {'text': 'Burger', 'score': 10},
        {'text': 'Pasta', 'score': 20}
      ],
    },
  ];

  void _answerQuestion(int score) {

    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  void _resetQuiz(){

    setState(() {
      _questionIndex =0;
      _totalScore = 0;
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Demo"),
      ),
      // added check for length of question - display widget in respect to that
      body: _questionIndex < questions.length
          ? Quiz(
              questions: questions,
              questionIndex: _questionIndex,
              answerQuestion: _answerQuestion)
          : Result(_totalScore,_resetQuiz),
    );
  }
}
