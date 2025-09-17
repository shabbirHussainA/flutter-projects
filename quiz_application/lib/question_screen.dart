import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_application/answer_button.dart';
import 'package:quiz_application/data/questions.dart';
import 'package:quiz_application/model/quiz_question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var questionIndex = 0;
 void answerQuestion(String answer){
    widget.onSelectAnswer(answer);
    if(questionIndex >= Questions.length -1) return;
    setState(() {
    questionIndex +=1;
    });
  }


  @override
  Widget build(BuildContext context) {
  final QuizQuestion currentQuestion = Questions[questionIndex];
    return Container(
      margin: const EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.questionText,
              style: GoogleFonts.lato(color: Colors.white, fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answer, onTap: (){answerQuestion(answer);} );
            }),
          ],
        ),
      ),
    );
  }
}
