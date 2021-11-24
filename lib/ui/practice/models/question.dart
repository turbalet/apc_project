class Question {

  String type;
  String text;
  String correctAnswer;
  String? received;
  bool? accepting;
  List<String> answers;


  Question(this.type, this.text, this.correctAnswer, this.answers);
  

}