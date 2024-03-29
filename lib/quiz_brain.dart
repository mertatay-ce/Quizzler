import 'package:quizzler/question.dart';

class QuizBrain {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bonnes are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: true)
  ];

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  int size() {
    return _questionBank.length;
  }

  void NextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
