import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;
  final List<Map<String, dynamic>> answers;
  final Function onAnswerQuestion;

  Question(
      {required this.question,
      required this.answers,
      required this.onAnswerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(question, style: const TextStyle(fontSize: 30)),
          ...answers.map((answer) => ElevatedButton(
                onPressed: () => onAnswerQuestion(answer["isCorrect"]),
                child: Text(answer["answer"],
                    style: const TextStyle(fontSize: 20)),
              ))
        ]);
  }
}
