class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getSheffeldAnswers() {
    final sheffeldList = List.of(answers);
    sheffeldList.shuffle();
    return sheffeldList;
  }
}