import 'package:apc_project/data/model/unit.dart';

class Chapter {

  String id;
  String title;
  String img;
  List<Unit> units;

  Chapter({
    required this.id,
    required this.title,
    required this.img,
    required this.units
  });


  factory Chapter.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['units'] as List;
    List<Unit> units = list.map((e) => Unit.fromJson(e)).toList();

    return Chapter(
        id: parsedJson['id'],
        title: parsedJson['title'],
        img: parsedJson['img'],
        units: units
    );
  }
}

class ChapterList {
  List<Chapter> chapters;

  ChapterList({
    required this.chapters
  });

  factory ChapterList.fromJson(List<dynamic> parsedJson) {
    List<Chapter> chapters = parsedJson.map((e) => Chapter.fromJson(e)).toList();
    return ChapterList(chapters: chapters);
  }
}