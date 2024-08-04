import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/data/questions.dart';

class ResultsScreen extends StatelessWidget {

  const ResultsScreen(this.choosenAnswers, this.onRestart, {super.key});

  final List<String> choosenAnswers;

final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for(var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i],
      });
    }

    return summary;
  }


  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('You have answered all questions! and $numCorrectAnswers out of $numTotalQuestions questions answered correctly!', textAlign: TextAlign.center, style: GoogleFonts.lato(
              fontSize: 24,
              color: const Color.fromARGB(255, 0, 90, 106),
              fontWeight: FontWeight.bold,
              height: 1.3,
            )),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart, icon: const Icon(Icons.refresh),
            label: const Text('Restart Quiz'),)
          ],
        ),
      )
    );
  }
}