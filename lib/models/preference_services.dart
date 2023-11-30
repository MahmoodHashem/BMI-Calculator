import 'package:bmi/models/history.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class PreferenceService{

  void saveHistory(History history) async {

    final preference = await SharedPreferences.getInstance();

    final bmiList = preference.setStringList('bmi', history.bmi);
    final result = preference.setStringList('result', history.result);

    debugPrint("History saved ");
  }

  Future<History> getHistory() async{

    final preference = await SharedPreferences.getInstance();

    final bmiList = preference.getStringList('bmi');
    final resultList = preference.getStringList('result');

    return History(bmi: bmiList!, result: resultList!);


  }

}