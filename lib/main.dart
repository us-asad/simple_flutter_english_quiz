import 'package:flutter/material.dart';
import 'package:my_english_quiz/widgets/result.dart';
import './widgets/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "1. ___ is your name ?",
      "answers": [
        {"answer": "What", "isCorrect": true},
        {"answer": "And", "isCorrect": false},
        {"answer": "How", "isCorrect": false},
        {"answer": "Why", "isCorrect": false},
      ]
    },
    {
      "question": "2. What ___ your name ?",
      "answers": [
        {"answer": "are", "isCorrect": false},
        {"answer": "is", "isCorrect": true},
        {"answer": "he", "isCorrect": false},
        {"answer": "she", "isCorrect": false},
      ]
    },
    {
      "question": "3. What is ___ name ?",
      "answers": [
        {"answer": "you", "isCorrect": false},
        {"answer": "he", "isCorrect": false},
        {"answer": "me", "isCorrect": false},
        {"answer": "your", "isCorrect": true},
      ]
    },
    {
      "question": "4. What is your ___ ?",
      "answers": [
        {"answer": "have", "isCorrect": false},
        {"answer": "haha", "isCorrect": false},
        {"answer": "name", "isCorrect": true},
        {"answer": "typical", "isCorrect": false},
      ]
    }
  ];

  int currentQuestionIndex = 0;
  int correctAnswersCount = 0;

  void onAnswerQuestion(bool isCorrect) {
    setState(() {
      currentQuestionIndex = currentQuestionIndex + 1;
      if (isCorrect) {
        correctAnswersCount++;
      }
    });
  }

  void onRestartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      correctAnswersCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.teal,
                title: const Text("English Quiz")),
            body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: currentQuestionIndex < questions.length
                    ? Question(
                        question: questions[currentQuestionIndex]["question"],
                        answers: questions[currentQuestionIndex]["answers"],
                        onAnswerQuestion: onAnswerQuestion)
                    : Result(
                        correctAnswersCount: correctAnswersCount,
                        totalQuestionsCount: questions.length,
                        onRestartQuiz: onRestartQuiz))));
  }
}
