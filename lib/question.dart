class Question {
  late String _questionText;
  late bool _questionAnswer;

  Question({required String q, required bool a}) {
    this._questionText = q;
    this._questionAnswer = a;
  }

  String get questionText => _questionText;

  set questionAnswer(bool value) {
    _questionAnswer = value;
  }

  set questionText(String value) {
    _questionText = value;
  }

  bool get questionAnswer => _questionAnswer;
}
