import 'package:client/lab6/quiz_brain.dart';
import 'package:flutter/material.dart';

class lab6 extends StatefulWidget {
  const lab6({super.key});

  @override
  State<lab6> createState() => _lab6State();
}

class _lab6State extends State<lab6> {
  List<Icon> scoreKeeper = [];
  QuizBrain quizBrain = QuizBrain();
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (quizBrain.isFinished()) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Quiz Finished'),
            content: Text('You\'ve reached the end of the quiz.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    quizBrain.reset();
                    scoreKeeper.clear();
                  });
                },
                child: Text('Restart'),
              ),
            ],
          ),
        );
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
        } else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
        }
        quizBrain.nextQuestion();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: SingleChildScrollView(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: const Color.fromARGB(255, 3, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}