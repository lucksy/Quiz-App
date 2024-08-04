import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(129, 255, 255, 255),
          ),
        const SizedBox(height: 50),
        const Text("This is the start screen",
            style: TextStyle(fontSize: 24, color: Colors.white)),
        const SizedBox(height: 20),
        OutlinedButton.icon(
            onPressed: startQuiz,
            icon: const Icon(Icons.arrow_right_alt, color: Colors.white),
            style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    color: Color.fromARGB(255, 0, 166, 255), width: 2),
                foregroundColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 0, 166, 255),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3))),
            label: const Text('Start Quiz')),

      ],
    ));
  }
}
