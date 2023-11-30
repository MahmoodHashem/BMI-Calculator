import 'package:bmi/models/history.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class PreferenceService{

  void saveHistory(History history) async {

    final preference = await SharedPreferences.getInstance();

    final bmiList = preference.setStringList('bmi', history.bmi);
    final result = preference.setStringList('result', history.result);
    final height = preference.setStringList('height', history.height);
    final weight = preference.setStringList('weight', history.weight);
    final hour = preference.setStringList('hour', history.hour);
    final month = preference.setStringList('month', history.month);

    debugPrint("History saved ");
  }

  Future<History> getHistory() async{

    final preference = await SharedPreferences.getInstance();

    final bmiList = preference.getStringList('bmi');
    final resultList = preference.getStringList('result');
    final heightList = preference.getStringList('height');
    final weightList = preference.getStringList('weight');
    final hourList = preference.getStringList('hour');
    final monthList = preference.getStringList('month');

    return History(
        bmi: bmiList!.reversed.toList(),
        result: resultList!.reversed.toList(),
        height: heightList!.reversed.toList(),
        weight: weightList!.reversed.toList(),
        hour: hourList!.reversed.toList(),
        month: monthList!.reversed.toList(),
    );
  }

}