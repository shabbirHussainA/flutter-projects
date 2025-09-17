import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_application/data/questions.dart';
import 'package:quiz_application/question_summary.dart';

class ResultScreen extends StatelessWidget{
   ResultScreen({super.key, required this.chooseAnswers, required this.restartQuiz});

  final List<String> chooseAnswers;
  final numberOfQuestions = Questions.length;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chooseAnswers.length; i++){
      summary.add({
        'question_index': i,
        'question': Questions[i].questionText,
        'correct_answer': Questions[i].answers[0],
        'user_answer': chooseAnswers[i],
      });
      if(chooseAnswers[i] == Questions[i].answers[0]){
        summary[i]['result'] = true;
      }
    }
      return summary;
  }
  final void Function() restartQuiz;

  @override
  Widget build(context){
    final score = getSummaryData().where((element) => element['result'] == true).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin:  const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('you answered ${score} out of ${numberOfQuestions} questions', style: GoogleFonts.lato(color: Colors.white, fontSize: 20), textAlign: TextAlign.center,),
            const SizedBox(height: 30,),
            QuestionSummary(getSummaryData()),
            TextButton.icon(onPressed: restartQuiz, icon: const Icon(Icons.refresh), label: const Text('Restart Quiz'), style: TextButton.styleFrom(foregroundColor: Colors.white),)
          ],
        ),
      ),
    );
  }
}