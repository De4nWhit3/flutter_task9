import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Game game = Game();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 58, 88, 109),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Dean\'s Quiz App'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              QuestionChildWidget(question: game.gameQuestions[0]),
              QuestionChildWidget(question: game.gameQuestions[1]),
              QuestionChildWidget(question: game.gameQuestions[2]),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionChildWidget extends StatelessWidget {
  final Question question;
  const QuestionChildWidget({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 250,
          height: 150,
          child: ImageFiltered(
            imageFilter: ImageFilter.matrix(
              Matrix4.rotationZ(.1).storage,
            ),
            child: Image.asset(
              question.imageURL,
              // fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          textAlign: TextAlign.center,
          question.question,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 30,
          width: double.infinity,
        ),
        CustomPrettyButton(labelText: question.answers[0].value),
        const SizedBox(
          height: 20,
        ),
        CustomPrettyButton(labelText: question.answers[1].value),
        const SizedBox(
          height: 20,
        ),
        CustomPrettyButton(labelText: question.answers[2].value),
        const SizedBox(
          height: 20,
        ),
        CustomPrettyButton(labelText: question.answers[3].value),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}

class CustomPrettyButton extends StatelessWidget {
  final String labelText;
  const CustomPrettyButton({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 18, 76, 124),
        borderRadius: BorderRadius.circular(45),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 15,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 193, 202, 209),
            borderRadius: BorderRadius.circular(40)),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue,
                  Color.fromARGB(255, 24, 99, 160),
                ],
              ),
              borderRadius: BorderRadius.circular(35)),
          child: Container(
            // width: 200.0,
            padding: const EdgeInsets.only(
              right: 10,
              left: 10,
            ),
            height: 30.0,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 24, 99, 160),
                    Colors.blue,
                  ],
                ),
                borderRadius: BorderRadius.circular(30)),
            child: RawMaterialButton(
              elevation: 0.0,
              child: Text(labelText,
                  style: const TextStyle(
                    fontSize: 16,
                  )),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}

class Game {
  List<Question> gameQuestions = [];

  Game() {
    List<Answer> q1Answers = [
      Answer(value: 'Snow White', correct: true),
      Answer(value: 'Lilo and Stitch', correct: false),
      Answer(value: 'Cinderella', correct: false),
      Answer(value: 'Lord of the Rings', correct: false),
    ];

    gameQuestions.add(Question(
        question: 'What was Walt Disney\'s first film?',
        category: 'Movies',
        answers: q1Answers,
        imageURL: 'assets/disney.jpg'));

    List<Answer> q2Answers = [
      Answer(value: 'The Princess and the Frog', correct: false),
      Answer(value: 'The Great Gatsby', correct: false),
      Answer(value: 'Toy Story', correct: true),
      Answer(value: 'The Lion King', correct: false),
    ];

    gameQuestions.add(Question(
        question: 'Which one of the following is a Pixar film?',
        category: 'Movies',
        answers: q2Answers,
        imageURL: 'assets/pixar.png'));

    List<Answer> q3Answers = [
      Answer(value: 'Beef', correct: false),
      Answer(value: 'Bananas', correct: false),
      Answer(value: 'Tomatoes', correct: false),
      Answer(value: 'Peas', correct: true),
    ];

    gameQuestions.add(Question(
        question: 'Which one of the following is a vegetable?',
        category: 'Food',
        answers: q3Answers,
        imageURL: 'assets/vegetables.jpg'));
  }
}

class Question {
  final String question;
  final String category;
  final List<Answer> answers;
  final String imageURL;

  Question(
      {required this.question,
      required this.category,
      required this.answers,
      required this.imageURL});
}

class Answer {
  final String value;
  final bool correct;

  Answer({required this.value, required this.correct});
}
