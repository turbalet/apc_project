class Exercise {
  String question;
  String correctAnswer;
  List<String> answers;
  String type;
  String received;
  bool? accepting;

  Exercise({required this.question, required this.correctAnswer, required this.answers, required this.type, this.accepting =false, this.received = ""});

  factory Exercise.fromJson(Map<String, dynamic> parsedJson) {

    var answersFromJson = parsedJson['answers'];
    List<String> answersList = answersFromJson.cast<String>();

    return Exercise(
        question: parsedJson['question'],
        correctAnswer: parsedJson['correctAnswer'],
        answers: answersList,
        type: parsedJson['type']
    );
  }
}


class ExerciseList {
  List<Exercise> exercises;

  ExerciseList({
    required this.exercises
  });

  factory ExerciseList.fromJson(List<dynamic> parsedJson) {
    List<Exercise> exercises = parsedJson.map((e) => Exercise.fromJson(e)).toList();
    return ExerciseList(exercises: exercises);
  }
}