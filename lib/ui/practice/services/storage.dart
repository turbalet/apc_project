import 'dart:convert';

import 'package:apc_project/data/model/exercise.dart';
import 'package:apc_project/data/model/unit.dart';
import 'package:flutter/services.dart';

class Storage {

  static UnitList unitList = UnitList(units: [Unit(id: 'e', title: 'e', lecturePath: 'e', exercises: [Exercise(question: 'e', correctAnswer: 'e', answers: ['e'], type: 'e')])]);

  static void initialize() async {
    String jsonUnits = await _loadUnitAsset();
    print(jsonUnits);
    final jsonResp = json.decode(jsonUnits);
    unitList = UnitList.fromJson(jsonResp);
  }

  static Future<String> _loadUnitAsset() async {
    return await rootBundle.loadString('assets/storage/data.json');
  }


}