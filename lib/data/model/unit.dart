import 'package:apc_project/data/storage.dart';

import 'exercise.dart';

class Unit {
  String id;
  String title;
  String lecturePath;
  List<Exercise> exercises;

  Unit({
    required this.id,
    required this.title,
    required this.lecturePath,
    required this.exercises
  });


  static getUnit(String id) {
    var unit;
    for (var element in Storage.chapterList!.chapters) {
      unit = element.units.where((element) => element.id.contains(id)).toList();
    }
    return unit[0];
  }

  factory Unit.fromJson(Map<String, dynamic> parsedJson) {

    var list = parsedJson['exercises'] as List;
    List<Exercise> exercises = list.map((e) => Exercise.fromJson(e)).toList();

    return Unit(
        id: parsedJson['id'],
        title: parsedJson['title'],
        lecturePath: parsedJson['lecturePath'],
        exercises: exercises
    );
  }
}

class UnitList {
  List<Unit> units;

  UnitList({
    required this.units
  });

  factory UnitList.fromJson(List<dynamic> parsedJson) {
    List<Unit> units = parsedJson.map((e) => Unit.fromJson(e)).toList();
    return UnitList(units: units);
  }
}