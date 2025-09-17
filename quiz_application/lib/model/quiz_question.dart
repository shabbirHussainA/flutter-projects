class QuizQuestion {
  QuizQuestion(this.questionText, this.answers);
  final String questionText;
  final List<String> answers;

  List<String> getShuffledAnswers() {
     final shuffledAnswers = List.of(answers);
     shuffledAnswers.shuffle();
    return shuffledAnswers;
  }

}