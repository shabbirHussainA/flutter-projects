import 'package:flutter/material.dart';
import 'package:quiz_application/data/questions.dart';
import 'package:quiz_application/question_screen.dart';
import 'package:quiz_application/result_screen.dart';
import 'package:quiz_application/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == Questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }
  @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.deepPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
   child: activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : activeScreen == 'question-screen' 
                  ? QuestionScreen(onSelectAnswer: chooseAnswer,)
                  : ResultScreen(chooseAnswers: selectedAnswers,restartQuiz: restartQuiz,),
        ),
      ),
    );
  }
}
