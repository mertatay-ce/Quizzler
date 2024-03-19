import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  // List<String> questions = [];
  //
  // List<bool> answers = [false, true, true];
  void checkAnswer(bool userPickedAnswer) {
    if (isFinished()) {
      Alert(
              context: context,
              title: 'Finished!',
              desc: 'You\'ve reached the end of the quiz!')
          .show();
      quizBrain.reset();
      scoreKeeper.clear();
    } else {
      bool correctAnswer = quizBrain.getQuestionAnswer();
      setState(() {
        if (userPickedAnswer == correctAnswer) {
          print('user got it right!');
          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
        } else {
          print('user got it wrong!');
          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
        }

        quizBrain.NextQuestion();
      });
    }
  }

  bool isFinished() {
    if (scoreKeeper.length - 1 == quizBrain.size() - 1) {
      return true;
    } else {
      return false;
    }
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
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
            )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () {
                  checkAnswer(true);
                },
                child: const Text(
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                    'True')),
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                onPressed: () {
                  checkAnswer(false);
                },
                child: const Text(
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                    'False')),
          ),
        )),
        // TODO: Add a row here as your score keeper
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
