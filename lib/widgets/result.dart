import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int correctAnswersCount;
  final int totalQuestionsCount;
  final Function() onRestartQuiz;

  Result({
    required this.correctAnswersCount,
    required this.totalQuestionsCount,
    required this.onRestartQuiz,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("Result: $correctAnswersCount/$totalQuestionsCount",
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ElevatedButton.icon(
          onPressed: onRestartQuiz,
          icon: const Icon(Icons.restart_alt),
          label: const Text("RESTART"))
    ]));
  }
}
