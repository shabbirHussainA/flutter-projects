import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      // Use Center to horizontally and vertically center the content.
      child: Column(
        mainAxisSize: MainAxisSize
            .min, // Use MainAxisSize.min to make the column as small as its children.
        children: [
          Image(image: AssetImage('assets/images/quiz-logo.png'), width: 300, color:  const Color.fromARGB(113, 255, 255, 255)),
          SizedBox(height: 50),
          Text( 'Learn Flutter the fun way!',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
              )),
          SizedBox(height: 20),
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: startQuiz,
            label: const Text('Start Quiz'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white
            )
          ),
        ],
      ),
    );
  }
}
