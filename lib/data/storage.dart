import 'dart:convert';

import 'package:flutter/services.dart';

import 'model/chapter.dart';

class Storage {

  static ChapterList? chapterList;

  static void initialize() async {
    String jsonUnits = await _loadUnitAsset();
    final jsonResp = json.decode(jsonUnits);
    chapterList = ChapterList.fromJson(jsonResp);
  }

  static Future<String> _loadUnitAsset() async {
    return await rootBundle.loadString('assets/storage/data.json');
  }


}