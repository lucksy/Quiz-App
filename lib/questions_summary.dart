import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            children: summaryData.map((summary) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.ltr,
                  verticalDirection: VerticalDirection.down,
                  children: [
                    SizedBox(
                      width: 36,
                      height: 36,
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: summary['correct_answer'] ==
                                    summary['user_answer']
                                ? Colors.green
                                : Colors.red,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(((summary['question_index'] as int) + 1)
                              .toString())),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(summary['question'] as String,
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color.fromARGB(255, 0, 90, 106),
                                  fontWeight: FontWeight.bold,
                                  height: 1.3,
                                )),
                            const SizedBox(height: 10),
                            Text('Correct answer: ${summary['correct_answer']}',
                                style: const TextStyle(color: Colors.green)),
                            const SizedBox(height: 10),
                            Text(
                              'Your answer: ${summary['user_answer']}',
                              style: TextStyle(
                                  color: summary['correct_answer'] ==
                                          summary['user_answer']
                                      ? Colors.green
                                      : Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
